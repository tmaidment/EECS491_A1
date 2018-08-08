%% import stuff
test2 = importfile('test2.csv', 2, 38793);

%% crop data
protocol = test2(:,5);
info = test2(:,7);

%% analysis 
timeout = '\[TCP Retransmission\]';
retransmit = '\[TCP Fast Retransmission]\]';
packet = '\[ACK\]';

timeouts = sum(~cellfun('isempty', regexp(cellstr(info), timeout)));
retransmits = sum(~cellfun('isempty', regexp(cellstr(info), retransmit)));

TCPpackets = sum(~cellfun('isempty', regexp(cellstr(info), packet)));

lostPackets = timeouts + retransmits;

%% predicting probability of loss event

% probability 80 packets are lost, given 24288 packets
ex1 = binopdf(80, 24288, 0.00288);