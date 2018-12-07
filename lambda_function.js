var aws = require('aws-sdk')
var s3 = new aws.S3({ apiVersion: '2006-03-01' })
var ets = new aws.ElasticTranscoder({ apiVersion: '2012-09-25', region: 'ap-northeast-1' })

exports.handler = function (event, context) {
  console.log('Received event:')
  console.log(JSON.stringify(event, null, '  '))
  var bucket = event.Records[0].s3.bucket.name
  var key = event.Records[0].s3.object.key
  var pipelineId = '1538531013874-5lvp4w'
  var highBitRatePresetId = '1351620000001-200015'
  var midBitRatePresetId = '1351620000001-200035'
  var lowBitRatePresetId = '1351620000001-200055'
  var AudioPresetId = '1351620000001-200060'
  var fileName = key.split('/').slice(-1)[0].replace('.mp4', '')
  var serverEnv = key.split('/').slice(0)[0]
  ets.createJob({
    PipelineId: pipelineId,
    OutputKeyPrefix: serverEnv + '/stream/' + fileName + '/',
    Input: {
      Key: key,
      FrameRate: 'auto',
      Resolution: 'auto',
      AspectRatio: 'auto',
      Interlaced: 'auto', 
      Container: 'auto',
    },
    Outputs: [
      {
        Key: 'hls-high-' + fileName,
        PresetId: highBitRatePresetId,
        Rotate: 'auto',
        SegmentDuration: "10"
      },
      {
        Key: 'hls-mid-' + fileName,
        PresetId: midBitRatePresetId,
        Rotate: 'auto',
        SegmentDuration: "10"
      },
      {
        Key: 'hls-low-' + fileName,
        PresetId: lowBitRatePresetId,
        Rotate: 'auto',
        SegmentDuration: "10"
      },
      {
        Key: 'hls-audio-' + fileName,
        PresetId: AudioPresetId,
        SegmentDuration: "10"
      },
    ],
    Playlists: [
      {
        Format: 'HLSv4',
        Name: 'index',
        OutputKeys: [
          'hls-high-' + fileName,
          'hls-mid-' + fileName,
          'hls-low-' + fileName,
          'hls-audio-' + fileName,
        ],
      },
    ],
  }, function (error, data) {
    if (error) {
      console.log(error)
      context.done('error', error)
    } else {
      console.log('Job submitted')
      context.done(null, '')
    }
  })
}