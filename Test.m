data = [[8,4.5]; [5,3.8]; [3,4.5]; [5,3]; [3,4.1]; [6,4.8]; [3,4.8]; [6,4]; [7,4.5]; [5,4];
        [13,1.7]; [10,2]; [18,1.8]; [17,0.5]; [12,1.2]; [11,1.5]; [19,1]; [17,1.5]; [14,1.2]; [13,1.5];
        [21,4.5]; [23,3]; [25,3.5]; [27,4]; [23,4.5]; [24,3.5]; [25,4.5]; [28,4.2]; [22,3.8]; [26,3.7]];
data = [[8,4.5]; [5,3.8]; [3,4.5]; [5,3]; [3,4.1]; [6,4.8]; [3,4.8]; [6,4]; [7,4.5]; [5,4];
        [13,1.7]; [10,2]; [18,1.8]; [17,0.2]; [12,1.2]; [11,1.5]; [19,1]; [17,1.6]; [14,1.2]; [13,1.5];
        [21,4.5]; [23,3]; [25,3.5]; [27,3.8]; [23,4.5]; [24,3.5]; [25,4.5]; [29,4.5]; [22,3.8]; [26,3.7]];
label_Range = [[1:10]; [11:20]; [21:30]];

for i= 1:10
        avg(i,:) = (data(i,:) + data(i+10,:) + data(i+20,:))/3;
end
avg

%% SVM1
clc
avg*[-0.21, 0.935]' - 0.75
%% SVM2
clc
avg*[-0.008, -2]' + 5

%% SVM3
clc
avg*[0.212, 0.78426]' - 6.2235

%%
%% plot
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

plot(avg(:,1), avg(:,2),'gO', 'LineWidth',3, 'MarkerFaceColor','y', 'MarkerSize', 10)