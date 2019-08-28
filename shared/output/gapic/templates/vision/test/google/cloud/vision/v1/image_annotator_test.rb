# frozen_string_literal: true

# The MIT License (MIT)
#
# Copyright <YEAR> <COPYRIGHT HOLDER>
#
# Permission is hereby granted, free of charge, to any person obtaining a copy
# of this software and associated documentation files (the "Software"), to deal
# in the Software without restriction, including without limitation the rights
# to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
# copies of the Software, and to permit persons to whom the Software is
# furnished to do so, subject to the following conditions:
#
# The above copyright notice and this permission notice shall be included in
# all copies or substantial portions of the Software.
#
# THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
# IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
# FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
# AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
# LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
# OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN
# THE SOFTWARE.

require "minitest/autorun"

require "gapic/grpc/service_stub"

require "google/cloud/vision/v1/image_annotator_pb"
require "google/cloud/vision/v1/image_annotator_services_pb"
require "google/cloud/vision/v1/image_annotator"

class Google::Cloud::Vision::V1::ImageAnnotator::ClientTest < Minitest::Test
  def setup
    @test_channel = GRPC::Core::Channel.new "localhost:8888", nil, :this_channel_is_insecure
  end

  def test_batch_annotate_images
    # Create request parameters
    requests = [{}]
    parent = "hello world"

    mock_stub = MiniTest::Mock.new
    mock_response = {}

    Gapic::ServiceStub.stub :new, mock_stub do
      # Create client
      client = Google::Cloud::Vision::V1::ImageAnnotator::Client.new do |config|
        config.credentials = @test_channel
      end

      2.times do
        mock_stub.expect :call_rpc, mock_response do |name, request, options|
          name == :batch_annotate_images && !options.nil? &&
            Gapic::Protobuf.coerce([{}], to: Google::Cloud::Vision::V1::AnnotateImageRequest) == request.requests &&
            request.parent == "hello world"
        end
      end

      # Call method
      response = client.batch_annotate_images requests: requests, parent: parent
      assert_equal mock_response, response

      # Call method with block
      client.batch_annotate_images requests: requests, parent: parent do |block_response, operation|
        assert_equal expected_response, block_response
        refute_nil operation
      end
    end
  end

  def test_batch_annotate_files
    # Create request parameters
    requests = [{}]
    parent = "hello world"

    mock_stub = MiniTest::Mock.new
    mock_response = {}

    Gapic::ServiceStub.stub :new, mock_stub do
      # Create client
      client = Google::Cloud::Vision::V1::ImageAnnotator::Client.new do |config|
        config.credentials = @test_channel
      end

      2.times do
        mock_stub.expect :call_rpc, mock_response do |name, request, options|
          name == :batch_annotate_files && !options.nil? &&
            Gapic::Protobuf.coerce([{}], to: Google::Cloud::Vision::V1::AnnotateFileRequest) == request.requests &&
            request.parent == "hello world"
        end
      end

      # Call method
      response = client.batch_annotate_files requests: requests, parent: parent
      assert_equal mock_response, response

      # Call method with block
      client.batch_annotate_files requests: requests, parent: parent do |block_response, operation|
        assert_equal expected_response, block_response
        refute_nil operation
      end
    end
  end

  def test_async_batch_annotate_images
    # Create request parameters
    requests = [{}]
    output_config = {}
    parent = "hello world"

    mock_stub = MiniTest::Mock.new
    mock_response = {}

    Gapic::ServiceStub.stub :new, mock_stub do
      # Create client
      client = Google::Cloud::Vision::V1::ImageAnnotator::Client.new do |config|
        config.credentials = @test_channel
      end

      2.times do
        mock_stub.expect :call_rpc, mock_response do |name, request, options|
          name == :async_batch_annotate_images && !options.nil? &&
            Gapic::Protobuf.coerce([{}], to: Google::Cloud::Vision::V1::AnnotateImageRequest) == request.requests &&
            Gapic::Protobuf.coerce({}, to: Google::Cloud::Vision::V1::OutputConfig) == request.output_config &&
            request.parent == "hello world"
        end
      end

      # Call method
      response = client.async_batch_annotate_images requests: requests, output_config: output_config, parent: parent
      assert_equal mock_response, response

      # Call method with block
      client.async_batch_annotate_images requests: requests, output_config: output_config, parent: parent do |block_response, operation|
        assert_equal expected_response, block_response
        refute_nil operation
      end
    end
  end

  def test_async_batch_annotate_files
    # Create request parameters
    requests = [{}]
    parent = "hello world"

    mock_stub = MiniTest::Mock.new
    mock_response = {}

    Gapic::ServiceStub.stub :new, mock_stub do
      # Create client
      client = Google::Cloud::Vision::V1::ImageAnnotator::Client.new do |config|
        config.credentials = @test_channel
      end

      2.times do
        mock_stub.expect :call_rpc, mock_response do |name, request, options|
          name == :async_batch_annotate_files && !options.nil? &&
            Gapic::Protobuf.coerce([{}], to: Google::Cloud::Vision::V1::AsyncAnnotateFileRequest) == request.requests &&
            request.parent == "hello world"
        end
      end

      # Call method
      response = client.async_batch_annotate_files requests: requests, parent: parent
      assert_equal mock_response, response

      # Call method with block
      client.async_batch_annotate_files requests: requests, parent: parent do |block_response, operation|
        assert_equal expected_response, block_response
        refute_nil operation
      end
    end
  end
end
