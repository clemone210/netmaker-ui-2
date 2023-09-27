import { Host } from '@/models/Host';
import { Node } from '@/models/Node';
import { ProSettings } from '@/models/ProSettings';

export const NULL_HOST: Host = {
  id: '',
  verbosity: 0,
  firewallinuse: '',
  version: '',
  name: '',
  os: '',
  debug: false,
  isstatic: false,
  listenport: 0,
  localrange: '',
  mtu: 0,
  interfaces: [],
  defaultinterface: '',
  endpointip: '',
  publickey: '',
  macaddress: '',
  nodes: [],
  isdefault: false,
  nat_type: 'public',
  persistentkeepalive: 0,
};

export const NULL_NODE: Node = {
  id: '',
  hostid: '',
  address: '',
  address6: '',
  localaddress: '',
  interface: '',
  macaddress: '',
  lastmodified: 0,
  expdatetime: 0,
  lastcheckin: 0,
  lastpeerupdate: 0,
  network: '',
  networkrange: '',
  networkrange6: '',
  pendingdelete: false,
  isegressgateway: false,
  isingressgateway: false,
  ingressdns: '',
  egressgatewayranges: [],
  egressgatewaynatenabled: false,
  failovernode: '',
  dnson: false,
  islocal: false,
  server: '',
  internetgateway: '',
  defaultacl: '',
  connected: false,
  failover: false,
  relayedby: '',
  relaynodes: [],
};

export const NULL_NETWORK_PROSETTINGS: ProSettings = {
  defaultaccesslevel: 0,
  defaultusernodelimit: 0,
  defaultuserclientlimit: 0,
  allowedusers: [],
  allowedgroups: [],
};
