
clear all
clc


% currPollution = area(1);
% currNoise = area(2);
% noiseDecayRate = area(3);
% maxSpeed = area(4);
% avgSpeed = area(5);
maxSpeeds=[2,2,2,2,2,2,2,2,2];
avgSpeeds=[1,1,1,1,1,1,1,1,1];
areas=zeros(9,5);
areas(:,3)=ones(9,1);
areas(:,4)=maxSpeeds;
areas(:,5) = avgSpeeds;

% RFID = car(1);
% pollKm = car(2);
% noise = car(3);
% hornNoise = car(4);
% finalTargetX = car(5);
% finalTargetY = car(6);
% currLocX = car(7);
% currLocY = car(8);
% currTargetX = car(9);
% currTargetY = car(10);
% currArea = car(11);
% speed = car(12);
% carOn = car(13);
% pending = car(14);
% horn = car(15);
% entered = car(16);
% sequence = car(17);
% emergency = car(18)
cars = [1,120,70,60,-1,1,0.9,-0.8,0.5,-1,9,0,1,0,0,0,8521,0;
        2,120,70,60,-1,-1,1,1,0.5,1,3,0,1,0,0,0,2587,0;
        3,120,70,60,-0.9,-0.9,0.9,0.9,0.5,1,3,0,1,0,0,0,2587,1];
cars = reshape(cars,18*3,1);
x0 = [reshape(areas,45,1);cars];

gates = [zeros(36,1);zeros(3*length(cars)/18,1)];

sequences = cars;

threshold = 200;
isReroute = 0;

T=10000000;
J=10000000;


rule = 1; %priority to jumps