%%
clear all; clc;    [[5,3];[21,4.5];[10,2]]; [[8,4.5];[23,3];[18,1.8]];
% Data
data = [[8,4.5]; [5,3.8]; [7,3.5]; [6,4.2];
        [13,1.7]; [11,1.5]; [15,1.3]; [17,0.5];
        [21,4.5]; [23,3]; [25,3.5]; [27,4]];
data = [[8,4.5]; [5,3.8]; [3,4.5]; [5,3]; [3,4.1]; [6,4.8]; [3,4.8]; [6,4]; [7,4.5]; [5,4];
        [13,1.7]; [10,2]; [18,1.8]; [17,0.5]; [12,1.2]; [11,1.5]; [19,1]; [17,1.5]; [14,1.2]; [13,1.5];
        [21,4.5]; [23,3]; [25,3.5]; [27,4]; [23,4.5]; [24,3.5]; [25,4.5]; [28,4.2]; [22,3.8]; [26,3.7]];
data = [[8,4.5]; [5,3.8]; [3,4.5]; [5,3]; [3,4.1]; [6,4.8]; [3,4.8]; [6,4]; [7,4.5]; [5,4];
        [13,1.7]; [10,2]; [18,1.8]; [17,0.2]; [12,1.2]; [11,1.5]; [19,1]; [17,1.6]; [14,1.2]; [13,1.5];
        [21,4.5]; [23,3]; [25,3.5]; [27,3.8]; [23,4.5]; [24,3.5]; [25,4.5]; [29,4.5]; [22,3.8]; [26,3.7]];
label_Range = [[1:10]; [11:20]; [21:30]];
class = ones(12,1);
class(label_Range(2,:)) = 2;
class(label_Range(3,:)) = 3;

%% plot
figure;
x = [0 20 0];
y = [1 5 5];
fill(x,y,'r', 'FaceAlpha',0.1, 'EdgeColor', 'none')
hold on;
grid on;
plot(data(label_Range(1,:),1), data(label_Range(1,:),2),'r*')
plot([0,20],[1 5],'r--');
plot(data(label_Range(2,:),1), data(label_Range(2,:),2),'bo')
plot([0,30],[2.5 2.5],'b--')
plot(data(label_Range(3,:),1), data(label_Range(3,:),2),'k^')
plot([10,30],[5 0],'k--')
ylim([0 5])
xlim([0 30])
xlabel('Petal length (mm)')
ylabel('Petal width (mm)')
title('Synthetic Flower Data')

%% 
% %Train the SVM Classifier
% % cl = fitcsvm(data,class,'KernelFunction','rbf',...
% %     'BoxConstraint',Inf,'ClassNames',[1,2,3]);
% t = templateLinear();
% linearMdl = fitcecoc(data,class, 'Learners',t, 'ClassNames',{'1','2','3'});
% linearMdl.ClassNames
% 
% %%
% x1Pts = linspace(0,30);
% x2Pts = linspace(0,5);
% [x1Grid,x2Grid] = meshgrid(x1Pts,x2Pts);
% 
% [label,~,~,Posterior]  = resubPredict(linearMdl,'Verbose',1);


%% plot
clc
figure;
x = [0 20 0];
y = [1 5 5];
fill(x,y,'r', 'FaceAlpha',0.1, 'EdgeColor', 'none')
hold on;
grid on;
plot(data(label_Range(1,:),1), data(label_Range(1,:),2),'r*')
plot([0,20],[1 5],'r--');
plot(data(label_Range(2,:),1), data(label_Range(2,:),2),'bo')
plot([0,30],[2.5 2.5],'b--')
plot(data(label_Range(3,:),1), data(label_Range(3,:),2),'k^')
plot([10,30],[5 0],'k--')
ylim([0 5])
xlim([0 30])
xlabel('Petal length (mm)')
ylabel('Petal width (mm)')
title('Synthetic Flower Data')
hold on;

selectedPoints = [[5,3];[21,4.5];[10,2]];
for i = 1:length(selectedPoints)
    pgon = polyshape([-0.5 -0.5 0.5 0.5]+selectedPoints(i,1),[0.13 -0.13 -0.13 0.13]+selectedPoints(i,2));
    plot(pgon, 'FaceColor', 'g')
end
%axis equal

%% SOLVe

CM = [34, -118.5, -56, 1;
      118.5, -461.25, -219, 1;
      56, -219, -104, 1;
      1, -1, -1, 0];
simequation(CM,[1;-1;-1;0])


%%
clc
figure;
hold on;
grid on;
plot(data(label_Range(1,:),1), data(label_Range(1,:),2),'r*')
% plot([0,20],[1 5],'r--');
plot(data(label_Range(2,:),1), data(label_Range(2,:),2),'bo')
% plot([0,30],[2.5 2.5],'b--')
plot(data(label_Range(3,:),1), data(label_Range(3,:),2),'k^')
% plot([10,30],[5 0],'k--')
ylim([0 5])
xlim([0 30])
xlabel('Petal length (mm)')
ylabel('Petal width (mm)')
title('Synthetic Flower Data')
hold on;

selectedPoints = [[5,3];[21,4.5];[10,2]];
for i = 1:length(selectedPoints)
    pgon = polyshape([-0.5 -0.5 0.5 0.5]+selectedPoints(i,1),[0.13 -0.13 -0.13 0.13]+selectedPoints(i,2));
    plot(pgon, 'FaceColor', 'g')
end

b0 = 0.75;
b1 = 0.21;
b2 = 0.935;
x1= linspace(0,30, 30); % Adapt n for resolution of graph
x2= (b0 + b1*x1)./b2;
plot(x1,x2, 'r--', 'LineWidth',2);

x = [0 x1(end) 0];
y = [b0 x2(end) 5];
fill(x,y,'r', 'FaceAlpha',0.1, 'EdgeColor', 'none')


%%


%% Class 2

%% plot
clc
figure;
x = [0 0 30 30];
y = [0 2.5 2.5 0];
fill(x,y,'b', 'FaceAlpha',0.1, 'EdgeColor', 'none')
hold on;
grid on;
plot(data(label_Range(1,:),1), data(label_Range(1,:),2),'r*')
plot([0,20],[1 5],'r--');
plot(data(label_Range(2,:),1), data(label_Range(2,:),2),'bo')
plot([0,30],[2.5 2.5],'b--')
plot(data(label_Range(3,:),1), data(label_Range(3,:),2),'k^')
plot([10,30],[5 0],'k--')
ylim([0 5])
xlim([0 30])
xlabel('Petal length (mm)')
ylabel('Petal width (mm)')
title('Synthetic Flower Data')
hold on;

selectedPoints = [[5,3];[23,3];[10,2]];
for i = 1:length(selectedPoints)
    pgon = polyshape([-0.5 -0.5 0.5 0.5]+selectedPoints(i,1),[0.13 -0.13 -0.13 0.13]+selectedPoints(i,2));
    plot(pgon, 'FaceColor', 'g')
end
%axis equal

%% SOLVe

CM = [34, 124, -56, -1;
      124, 538, -236, -1;
      -56, -236, 104, 1;
      -1, -1, 1, 0];
simequation(CM,[1;1;1;0])


%%
clc
figure;
hold on;
grid on;
plot(data(label_Range(1,:),1), data(label_Range(1,:),2),'r*')
% plot([0,20],[1 5],'r--');
plot(data(label_Range(2,:),1), data(label_Range(2,:),2),'bo')
% plot([0,30],[2.5 2.5],'b--')
plot(data(label_Range(3,:),1), data(label_Range(3,:),2),'k^')
% plot([10,30],[5 0],'k--')
ylim([0 5])
xlim([0 30])
xlabel('Petal length (mm)')
ylabel('Petal width (mm)')
title('Synthetic Flower Data')
hold on;

selectedPoints = [[5,3];[23,3];[10,2]];
for i = 1:length(selectedPoints)
    pgon = polyshape([-0.5 -0.5 0.5 0.5]+selectedPoints(i,1),[0.13 -0.13 -0.13 0.13]+selectedPoints(i,2));
    plot(pgon, 'FaceColor', 'g')
end

b0 = 5;
b1 = -0.008;
b2 = 2;
x1= linspace(0,30, 30); % Adapt n for resolution of graph
x2= (b0 + b1*x1)./b2;
plot(x1,x2, 'b--', 'LineWidth',2);

x = [0 0 x1(end) x1(end)];
y = [0 x2(1) x2(end) 0];
fill(x,y,'b', 'FaceAlpha',0.1, 'EdgeColor', 'none')


%% class 3
clc
figure;
hold on;
grid on;
x = [10 30 30];
y = [5 0 5];
fill(x,y,'k', 'FaceAlpha',0.1, 'EdgeColor', 'none')
plot(data(label_Range(1,:),1), data(label_Range(1,:),2),'r*')
plot([0,20],[1 5],'r--');
plot(data(label_Range(2,:),1), data(label_Range(2,:),2),'bo')
plot([0,30],[2.5 2.5],'b--')
plot(data(label_Range(3,:),1), data(label_Range(3,:),2),'k^')
plot([10,30],[5 0],'k--')
ylim([0 5])
xlim([0 30])
xlabel('Petal length (mm)')
ylabel('Petal width (mm)')
title('Synthetic Flower Data')
hold on;

selectedPoints = [[8,4.5];[23,3];[18,1.8]];
for i = 1:length(selectedPoints)
    pgon = polyshape([-0.5 -0.5 0.5 0.5]+selectedPoints(i,1),[0.13 -0.13 -0.13 0.13]+selectedPoints(i,2));
    plot(pgon, 'FaceColor', 'g')
end

%% 
figure;
hold on;
grid on;
plot(data(label_Range(1,:),1), data(label_Range(1,:),2),'r*')
% plot([0,20],[1 5],'r--');
plot(data(label_Range(2,:),1), data(label_Range(2,:),2),'bo')
% plot([0,30],[2.5 2.5],'b--')
plot(data(label_Range(3,:),1), data(label_Range(3,:),2),'k^')
% plot([10,30],[5 0],'k--')
ylim([0 5])
xlim([0 30])
xlabel('Petal length (mm)')
ylabel('Petal width (mm)')
title('Synthetic Flower Data')
hold on;
b0 = 6.2235;
b1 = -0.212;
b2 = 0.78426;
x1= linspace(0,30, 30); % Adapt n for resolution of graph
x2= (b0 + b1*x1)./b2;
plot(x1,x2, 'k--', 'LineWidth',2);

x = [x1(1) x1(end) 30];
y = [x2(1) x2(end) 5];
fill(x,y,'k', 'FaceAlpha',0.1, 'EdgeColor', 'none')

selectedPoints = [[8,4.5];[23,3];[18,1.8]];
for i = 1:length(selectedPoints)
    pgon = polyshape([-0.5 -0.5 0.5 0.5]+selectedPoints(i,1),[0.13 -0.13 -0.13 0.13]+selectedPoints(i,2));
    plot(pgon, 'FaceColor', 'g')
end

%%

%% 
figure;
hold on;
grid on;
plot(data(label_Range(1,:),1), data(label_Range(1,:),2),'r*')
% plot([0,20],[1 5],'r--');
plot(data(label_Range(2,:),1), data(label_Range(2,:),2),'bo')
% plot([0,30],[2.5 2.5],'b--')
plot(data(label_Range(3,:),1), data(label_Range(3,:),2),'k^')
% plot([10,30],[5 0],'k--')
ylim([0 5])
xlim([0 30])
xlabel('Petal length (mm)')
ylabel('Petal width (mm)')
title('Synthetic Flower Data')
hold on;
b0 = 6.2235;
b1 = -0.212;
b2 = 0.78426;
x1= linspace(0,30, 30); % Adapt n for resolution of graph
x2= (b0 + b1*x1)./b2;
plot(x1,x2, 'k--', 'LineWidth',2);

x = [x1(1) x1(end) 30];
y = [x2(1) x2(end) 5];
fill(x,y,'k', 'FaceAlpha',0.1, 'EdgeColor', 'none')

b0 = 5;
b1 = -0.008;
b2 = 2;
x1= linspace(0,30, 30); % Adapt n for resolution of graph
x2= (b0 + b1*x1)./b2;
plot(x1,x2, 'b--', 'LineWidth',2);


x = [0 0 x1(end) x1(end)];
y = [0 x2(1) x2(end) 0];
fill(x,y,'b', 'FaceAlpha',0.1, 'EdgeColor', 'none')

b0 = 0.75;
b1 = 0.21;
b2 = 0.935;
x1= linspace(0,30, 30); % Adapt n for resolution of graph
x2= (b0 + b1*x1)./b2;
plot(x1,x2, 'r--', 'LineWidth',2);

x = [0 x1(end) 0];
y = [b0 x2(end) 5];
fill(x,y,'r', 'FaceAlpha',0.1, 'EdgeColor', 'none')