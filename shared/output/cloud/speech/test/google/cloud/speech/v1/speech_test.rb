# frozen_string_literal: true

# Copyright 2018 Google LLC
#
# Licensed under the Apache License, Version 2.0 (the "License");
# you may not use this file except in compliance with the License.
# You may obtain a copy of the License at
#
#     https://www.apache.org/licenses/LICENSE-2.0
#
# Unless required by applicable law or agreed to in writing, software
# distributed under the License is distributed on an "AS IS" BASIS,
# WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
# See the License for the specific language governing permissions and
# limitations under the License.

require "minitest/autorun"

require "gapic/grpc/service_stub"

require "google/cloud/speech/v1/cloud_speech_pb"
require "google/cloud/speech/v1/cloud_speech_services_pb"
require "google/cloud/speech/v1/speech"

class Google::Cloud::Speech::V1::Speech::ClientTest < Minitest::Test
  def setup
    @test_channel = GRPC::Core::Channel.new "localhost:8888", nil, :this_channel_is_insecure
    @mock_stub = MiniTest::Mock.new
    @response = {}
    @options = {}
    @operation_callback = -> { raise "Operation callback was executed!" }
  end

  def test_recognize
    # Create request parameters
    config = {}
    audio = {}

    Gapic::ServiceStub.stub :new, @mock_stub do
      # Create client
      client = Google::Cloud::Speech::V1::Speech::Client.new do |config|
        config.credentials = @test_channel
      end

      8.times do |idx|
        @mock_stub.expect :call_rpc, @response do |name, request, options:, operation_callback:|
          has_name = name == :recognize
          has_options = !options.nil?
          has_operation_callback = operation_callback == (idx >= 4 ? @operation_callback : nil)
          has_fields =
            Gapic::Protobuf.coerce({}, to: Google::Cloud::Speech::V1::RecognitionConfig) == request.config &&

            Gapic::Protobuf.coerce({}, to: Google::Cloud::Speech::V1::RecognitionAudio) == request.audio

          assert has_name, "invalid method call: #{name} (expected recognize)"
          assert has_options, "invalid options: #{options} vs #{@options}"
          assert has_operation_callback, "invalid operation block"
          assert has_fields, "invalid field values"

          has_name && has_options && has_operation_callback && has_fields
        end
      end

      # Call method (positional / hash)
      response = client.recognize config: config, audio: audio
      assert_equal @response, response

      # Call method (positional / protobuf type)
      response = client.recognize(Google::Cloud::Speech::V1::RecognizeRequest.new(
                                    config: config, audio: audio
                                  ))
      assert_equal @response, response

      # Call method (named / hash)
      response = client.recognize request = { config: config, audio: audio }
      assert_equal @response, response

      # Call method (named / protobuf type)
      response = client.recognize request = Google::Cloud::Speech::V1::RecognizeRequest.new(
        config: config, audio: audio
      )
      assert_equal @response, response

      # Call method with options (positional / hash)
      response = client.recognize({ config: config, audio: audio }, @options, &@operation_callback)
      assert_equal @response, response

      # Call method with options (positional / protobuf type)
      response = client.recognize(Google::Cloud::Speech::V1::RecognizeRequest.new(
                                    config: config, audio: audio
                                  ), @options, &@operation_callback)
      assert_equal @response, response

      # Call method with options (named / hash)
      response = client.recognize request = { config: config, audio: audio }, options = @options, &@operation_callback
      assert_equal @response, response

      # Call method with options (named / protobuf type)
      response = client.recognize request = Google::Cloud::Speech::V1::RecognizeRequest.new(
        config: config, audio: audio
      ), options = @options, &@operation_callback
      assert_equal @response, response

      @mock_stub.verify
    end
  end

  def test_long_running_recognize
    # Create request parameters
    config = {}
    audio = {}

    Gapic::ServiceStub.stub :new, @mock_stub do
      # Create client
      client = Google::Cloud::Speech::V1::Speech::Client.new do |config|
        config.credentials = @test_channel
      end

      8.times do |idx|
        @mock_stub.expect :call_rpc, @response do |name, request, options:, operation_callback:, format_response:|
          has_name = name == :long_running_recognize
          has_options = !options.nil?
          has_operation_callback = operation_callback == (idx >= 4 ? @operation_callback : nil)
          has_fields =
            Gapic::Protobuf.coerce({}, to: Google::Cloud::Speech::V1::RecognitionConfig) == request.config &&

            Gapic::Protobuf.coerce({}, to: Google::Cloud::Speech::V1::RecognitionAudio) == request.audio

          assert has_name, "invalid method call: #{name} (expected long_running_recognize)"
          assert has_options, "invalid options: #{options} vs #{@options}"
          assert has_operation_callback, "invalid operation block"
          assert has_fields, "invalid field values"

          has_name && has_options && has_operation_callback && has_fields
        end
      end

      # Call method (positional / hash)
      response = client.long_running_recognize config: config, audio: audio
      assert_equal @response, response

      # Call method (positional / protobuf type)
      response = client.long_running_recognize(Google::Cloud::Speech::V1::LongRunningRecognizeRequest.new(
                                                 config: config, audio: audio
                                               ))
      assert_equal @response, response

      # Call method (named / hash)
      response = client.long_running_recognize request = { config: config, audio: audio }
      assert_equal @response, response

      # Call method (named / protobuf type)
      response = client.long_running_recognize request = Google::Cloud::Speech::V1::LongRunningRecognizeRequest.new(
        config: config, audio: audio
      )
      assert_equal @response, response

      # Call method with options (positional / hash)
      response = client.long_running_recognize({ config: config, audio: audio }, @options, &@operation_callback)
      assert_equal @response, response

      # Call method with options (positional / protobuf type)
      response = client.long_running_recognize(Google::Cloud::Speech::V1::LongRunningRecognizeRequest.new(
                                                 config: config, audio: audio
                                               ), @options, &@operation_callback)
      assert_equal @response, response

      # Call method with options (named / hash)
      response = client.long_running_recognize request = { config: config, audio: audio }, options = @options, &@operation_callback
      assert_equal @response, response

      # Call method with options (named / protobuf type)
      response = client.long_running_recognize request = Google::Cloud::Speech::V1::LongRunningRecognizeRequest.new(
        config: config, audio: audio
      ), options = @options, &@operation_callback
      assert_equal @response, response

      @mock_stub.verify
    end
  end

  # TODO
end
