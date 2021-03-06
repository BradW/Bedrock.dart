import '../../utils/Address.dart';
import 'EncapsulatedPacket.dart';
import 'Protocol.dart';

class ConnectionRequestAccepted extends EncapsulatedPacket {

  Address address;
  List<Address> systemAddresses = [ Address('127.0.0.1', 0, AddressFamily.V4) ];
  int pingTime;
  int pongTime;

  ConnectionRequestAccepted() : super(Protocol.ConnectionRequestAccepted);

  void encodeBody() {
    this.getStream().writeAddress(this.address);
    this.getStream().writeShort(0);
    
    Address addressFiller = new Address('0.0.0.0', 0, AddressFamily.V4);
    for(int i = 0; i < Protocol.SystemAddresses; i++) {
      this.getStream().writeAddress(this.systemAddresses.length > i  ? this.systemAddresses[i] : addressFiller);
    }

    this.getStream().writeLong(this.pingTime);
    this.getStream().writeLong(this.pongTime);
  }

}