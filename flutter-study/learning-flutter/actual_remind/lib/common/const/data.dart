import 'dart:io';

const ACCESS_TOKEN_KEY = 'ACCESS_TOKEN';
const REFRESH_TOKEN_KEY = 'REFRESH_TOKEN';

final emulatorIp = '192.168.219.104:5555';
final simulatorIp = '127.0.0.1:5555';

final IP = Platform.isIOS ? simulatorIp : emulatorIp;
