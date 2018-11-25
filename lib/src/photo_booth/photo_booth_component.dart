import 'dart:async';
import 'dart:html';

import 'package:angular/angular.dart';


/**
 * Created by sebas_000 on 20/07/2016.
 */


enum State {
  Recording,
  Confirming
}

class GotSnapshotEvent {
  Blob blob;
  String dataUrl;
  GotSnapshotEvent(Blob blob, String dataUrl) {
    this.blob = blob;
    this.dataUrl = dataUrl;
  }
}

@Component(
  selector: 'photo-booth',
  styleUrls: ['photo_booth_component.css'],
  templateUrl: 'photo_booth_component.html',
  directives: [NgStyle],
  exports: [State]
)
class PhotoBoothComponent implements AfterViewInit, OnDestroy {


  final StreamController<GotSnapshotEvent> gotSnapshotController = new StreamController.broadcast();

  @Output() Stream<GotSnapshotEvent> get gotSnapshot => gotSnapshotController.stream;

  State state = State.Recording;

  @ViewChild("video") VideoElement video;
  @ViewChild("canvas") CanvasElement canvas;
    
  String imgSrc;
  CanvasRenderingContext2D context;
  NgZone zone;

  PhotoBoothComponent(NgZone zone) {
    this.zone = zone;
  }

  static MediaStream STREAM;

  ngAfterViewInit() {
  
    if (STREAM != null) {

      releaseVideo();
      releaseStream();
    }
    
    window.navigator.getUserMedia(audio: false, video: true).then((stream) {
      
      STREAM = stream; // make stream available to console
      video.srcObject = stream;
      video.play();

    });    

    start();
  }

  start() {

    state = State.Recording;
  }

  snapshot() {

    if(STREAM != null) {
      
      canvas.width = video.videoWidth;
      canvas.height = video.videoHeight;

      context = canvas.getContext('2d');
      context.drawImage(video, 0, 0);
      
      imgSrc = canvas.toDataUrl('image/jpeg');

      state = State.Confirming;

      canvas.toBlob((blob) {
        zone.run(() {
          gotSnapshotController.add(new GotSnapshotEvent(blob, imgSrc));
        });
      }, '');
    }
  }


  releaseStream() {

    if(STREAM != null) {

        STREAM.getAudioTracks().forEach((track) {
          track.stop();
        });

        STREAM.getVideoTracks().forEach((track) {
          track.stop();
        });
    }
  }

  releaseVideo() {

    video.pause();
    video.src = null;
  }

  ngOnDestroy() {

    releaseVideo();
    releaseStream();
  }
}