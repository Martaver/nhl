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

  // State: State = State;
  State state = State.Recording;

  // @ViewChild("video") ElementRef videoRef;
  // VideoElement get video => videoRef.nativeElement;

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
    
    // video = this.element.nativeElement.querySelector('#recorder').querySelector('video');
    // this.navigator.getUserMedia = this.navigator.getUserMedia || this.navigator.webkitGetUserMedia || this.navigator.mozGetUserMedia || this.navigator.msGetUserMedia;

    if (STREAM != null) {

      releaseVideo();
      releaseStream();
    }
    
    window.navigator.getUserMedia(audio: false, video: true).then((stream) {
      
      STREAM = stream; // make stream available to console
      video.srcObject = stream;
      //Success      
      // if (window.navigator.mozGetUserMedia) {
      //   // this.video.mozSrcObject = stream;
      //   video.srcObject = stream;
      // } else {
      //   var vendorUrl = window.URL;
      //   if(vendorUrl == null) vendorUrl = window.webkitURL;
      //   video.src = vendorUrl.createObjectURL(stream);
        
      // }

      video.play();

    });    

    start();
  }

  start() {

    state = State.Recording;
  }

  snapshot() {

    if(STREAM != null) {

      // this.canvas = this.element.nativeElement.querySelector('#recorder').querySelector('canvas');
      canvas.width = video.videoWidth;
      canvas.height = video.videoHeight;

      context = canvas.getContext('2d');
      context.drawImage(video, 0, 0);

      //For some reason, image/jpeg is much more efficient than png.
      //Theory 1 : It could be that toDataURL is encoding a jpeg & compressing.
      //Theory 2 : It could have been that prevously when saving as png, when we upload a jpeg it gets decompressed and saved as a png and got huge.
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

      //Old, deprecated way of stopping the stream using MediaStream object.
      // if (STREAM.stop != null) { STREAM.stop(); }

      //New track-based approach to managing audio & video streams.
      // else {

        STREAM.getAudioTracks().forEach((track) {
          track.stop();
        });

        STREAM.getVideoTracks().forEach((track) {
          track.stop();
        });
      // }

      // this.window.stream = null;
    }
  }

  releaseVideo() {

    video.pause();
    video.src = null;
    // if(this.video.hasOwnProperty("mozSrcObject")) this.video["mozSrcObject"] = null;
  }

  ngOnDestroy() {

    releaseVideo();
    releaseStream();
  }
}