import Speech

// Using Apple's speech recognition framework
// https://developer.apple.com/documentation/speech/asking_permission_to_use_speech_recognition

// User permission
override public func viewDidAppear(_ animated: Bool) {
   // Configure the SFSpeechRecognizer object already
   // stored in a local member variable.
   speechRecognizer.delegate = self

   // Make the authorization request      
   SFSpeechRecognizer.requestAuthorization { authStatus in

   // The authorization status results in changes to the
   // app’s interface, so process the results on the app’s
   // main queue.
      OperationQueue.main.addOperation {
         switch authStatus {
            case .authorized:
               self.recordButton.isEnabled = true

            case .denied:
               self.recordButton.isEnabled = false
               self.recordButton.setTitle("User denied access 
                           to speech recognition", for: .disabled)

            case .restricted:
               self.recordButton.isEnabled = false
               self.recordButton.setTitle("Speech recognition
                       restricted on this device", for: .disabled)

            case .notDetermined:
               self.recordButton.isEnabled = false
               self.recordButton.setTitle("Speech recognition not yet
                                      authorized", for: .disabled)
         }
      }
   }
}

// Configuring the device audio input, not sure how this really works
// https://developer.apple.com/documentation/speech/sfspeechaudiobufferrecognitionrequest

private let audioEngine = AVAudioEngine()
func liveSpeech() {
    // Configure the audio session for the app.
    let audioSession = AVAudioSession.sharedInstance()
    try audioSession.setCategory(.record, mode: .measurement, options: .duckOthers)
    try audioSession.setActive(true, options: .notifyOthersOnDeactivation)
    let inputNode = audioEngine.inputNode

    // Configure the microphone input.
    let recordingFormat = inputNode.outputFormat(forBus: 0)
    inputNode.installTap(onBus: 0, bufferSize: 1024, format: recordingFormat) { (buffer: AVAudioPCMBuffer, when: AVAudioTime) in
        self.recognitionRequest?.append(buffer)
    }

    audioEngine.prepare()
    try audioEngine.start()

    // Create and configure the speech recognition request.
    recognitionRequest = SFSpeechAudioBufferRecognitionRequest()
    guard let recognitionRequest = recognitionRequest else { fatalError("Unable to create a SFSpeechAudioBufferRecognitionRequest object") }
    recognitionRequest.shouldReportPartialResults = true

    // Create a recognition task for the speech recognition session.
    // Keep a reference to the task so that it can be canceled.
    recognitionTask = speechRecognizer.recognitionTask(with: recognitionRequest) { result, error in
        var isFinal = false
        
        if let result = result {
            // Update the text view with the results.
            self.textView.text = result.bestTranscription.formattedString
            isFinal = result.isFinal
            print("Text \(result.bestTranscription.formattedString)")
        }
        
        if error != nil || isFinal {
            // Stop recognizing speech if there is a problem.
            self.audioEngine.stop()
            inputNode.removeTap(onBus: 0)

            self.recognitionRequest = nil
            self.recognitionTask = nil

            self.recordButton.isEnabled = true
            self.recordButton.setTitle("Start Recording", for: [])
        }
    }
}

// Availability of speech recognition
public func speechRecognizer(_ speechRecognizer: SFSpeechRecognizer, availabilityDidChange available: Bool) {
    if available {
        recordButton.isEnabled = true
        recordButton.setTitle("Start Recording", for: [])
    } else {
        recordButton.isEnabled = false
        recordButton.setTitle("Recognition Not Available", for: .disabled)
    }
}