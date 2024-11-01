
"use strict";

let Image = require('./Image.js');
let JointState = require('./JointState.js');
let JoyFeedback = require('./JoyFeedback.js');
let CompressedImage = require('./CompressedImage.js');
let MagneticField = require('./MagneticField.js');
let Illuminance = require('./Illuminance.js');
let Joy = require('./Joy.js');
let FluidPressure = require('./FluidPressure.js');
let CameraInfo = require('./CameraInfo.js');
let Temperature = require('./Temperature.js');
let LaserEcho = require('./LaserEcho.js');
let NavSatFix = require('./NavSatFix.js');
let RelativeHumidity = require('./RelativeHumidity.js');
let JoyFeedbackArray = require('./JoyFeedbackArray.js');
let TimeReference = require('./TimeReference.js');
let PointField = require('./PointField.js');
let NavSatStatus = require('./NavSatStatus.js');
let MultiDOFJointState = require('./MultiDOFJointState.js');
let LaserScan = require('./LaserScan.js');
let BatteryState = require('./BatteryState.js');
let Imu = require('./Imu.js');
let Range = require('./Range.js');
let ChannelFloat32 = require('./ChannelFloat32.js');
let PointCloud = require('./PointCloud.js');
let PointCloud2 = require('./PointCloud2.js');
let RegionOfInterest = require('./RegionOfInterest.js');
let MultiEchoLaserScan = require('./MultiEchoLaserScan.js');

module.exports = {
  Image: Image,
  JointState: JointState,
  JoyFeedback: JoyFeedback,
  CompressedImage: CompressedImage,
  MagneticField: MagneticField,
  Illuminance: Illuminance,
  Joy: Joy,
  FluidPressure: FluidPressure,
  CameraInfo: CameraInfo,
  Temperature: Temperature,
  LaserEcho: LaserEcho,
  NavSatFix: NavSatFix,
  RelativeHumidity: RelativeHumidity,
  JoyFeedbackArray: JoyFeedbackArray,
  TimeReference: TimeReference,
  PointField: PointField,
  NavSatStatus: NavSatStatus,
  MultiDOFJointState: MultiDOFJointState,
  LaserScan: LaserScan,
  BatteryState: BatteryState,
  Imu: Imu,
  Range: Range,
  ChannelFloat32: ChannelFloat32,
  PointCloud: PointCloud,
  PointCloud2: PointCloud2,
  RegionOfInterest: RegionOfInterest,
  MultiEchoLaserScan: MultiEchoLaserScan,
};
