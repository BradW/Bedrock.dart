import 'package:vector_math/vector_math.dart';

import '../../entity/Entity.dart';
import 'GamePacket.dart';
import '../../utils/Gamerule.dart';
import 'Protocol.dart';

class StartGame extends GamePacket {

  int entityId; // varlong
  int runtimeId; // varulong

  int gamemode = 0; // varint

  Vector3 position = Vector3(0, 20, 0); // float<x y z>

  double yaw = 0.0; // float
  double pitch = 0.0; // float

  int seed = 0; // varint
  int dimension = 0; // varint
  int generator = 1; // varint
  int worldGamemode = 0; // varint
  int difficulty = 2; // varint

  Vector3 spawnPosition = Vector3(0, 20, 0); // varint<x y z>

  bool allowCheats = true; // bool

  int time = 0; // varint

  int edition = 0; // ubyte

  bool allowEduFeatures = false; // bool

  double rainLevel = 0; // float
  double lightningLevel = 0; // float

  bool hasLockedContent = false; // bool
  bool isMultiplayer = true; // bool
  bool broadcasToLAN = true; // bool
  bool broadcastToXboxLive = true; // bool
  bool allowCommands = true; // bool
  bool textureRequired = false; // bool

  List<Gamerule> rules = []; // <string ubyte (bool | varuint | float)>[]

  bool allowBonusChest = false; // bool
  bool allowStartingMap = false; // bool
  bool trustPlayers = false; // bool

  int permissionLevel = 1; // varint
  int xboxLiveBroadcastMode = 0; // varint

  int chunkRadius = 4; // uint

  bool platformBroadcast = false; // bool

  int platformBroadcastMode = 0; // varint

  bool xboxLiveBroadcastIntent = false; // bool
  bool behaviourPackLocked = false; // bool
  bool resourcePackLocked = false; // bool
  bool worldTemplateLocked = false; // bool
  bool useMsaGamertags = false; // bool
  bool hasWorldTemplate = false; // bool
  bool worldTemplateOptionLocked = false; // bool

  String levelId = ''; // string, base64
  String worldName = ''; // string
  String worldTemplate = ''; // string

  bool isTrial = false; // bool

  int currentTick = 0; // ulong, only if isTrial

  int enchantmentSeed = 0; // varint

  List<int> runtimeIds = []; // varulong[]

  String multiplayerCorrelationId = ''; // string

  StartGame() : super(Protocol.StartGame);

  void encodeBody() {
    this.getStream().writeVarLong(this.entityId);
    this.getStream().writeUnsignedVarLong(this.runtimeId);
    this.getStream().writeVarInt(this.gamemode);
    this.getStream().writeVector3Float(this.position);
    this.getStream().writeLFloat(this.pitch);
    this.getStream().writeLFloat(this.yaw);
    this.getStream().writeVarInt(this.seed);
    this.getStream().writeVarInt(this.dimension);
    this.getStream().writeVarInt(this.generator);
    this.getStream().writeVarInt(this.worldGamemode);
    this.getStream().writeVarInt(this.difficulty);
    this.getStream().writePosition(this.spawnPosition);
    this.getStream().writeBoolean(this.allowCheats);
    this.getStream().writeVarInt(this.time);
    this.getStream().writeBoolean(this.edition == 1);
    this.getStream().writeBoolean(this.allowEduFeatures);
    this.getStream().writeLFloat(this.rainLevel);
    this.getStream().writeLFloat(this.lightningLevel);
    this.getStream().writeBoolean(this.hasLockedContent);
    this.getStream().writeBoolean(this.isMultiplayer);
    this.getStream().writeBoolean(this.broadcasToLAN);
    this.getStream().writeVarInt(this.xboxLiveBroadcastMode);
    this.getStream().writeVarInt(this.platformBroadcastMode);
    this.getStream().writeBoolean(this.allowCommands);
    this.getStream().writeBoolean(this.textureRequired);
    this.getStream().writeGamerules(this.rules);
    this.getStream().writeBoolean(this.allowBonusChest);
    this.getStream().writeBoolean(this.allowStartingMap);
    this.getStream().writeVarInt(this.permissionLevel);
    this.getStream().writeLInt(this.chunkRadius);
    this.getStream().writeBoolean(this.behaviourPackLocked);
    this.getStream().writeBoolean(this.resourcePackLocked);
    this.getStream().writeBoolean(this.worldTemplateLocked);
    this.getStream().writeBoolean(this.useMsaGamertags);
    this.getStream().writeBoolean(this.hasWorldTemplate);
    this.getStream().writeBoolean(this.worldTemplateOptionLocked);
    this.getStream().writeString(this.levelId);
    this.getStream().writeString(this.worldName);
    this.getStream().writeString(this.worldTemplate);
    this.getStream().writeBoolean(this.isTrial);
    this.getStream().writeLLong(this.currentTick);
    this.getStream().writeVarInt(this.enchantmentSeed);

    this.getStream().writeUnsignedVarInt(Entity.runtimeIds.length);
    for(final List item in Entity.runtimeIds) {
      this.getStream().writeString(item[0]);
      this.getStream().writeLShort(item[1]);
    }

    this.getStream().writeString(this.multiplayerCorrelationId);
  }

}