clear; close all; clc;

num_tracker = 54;
results = [
    struct('tracker','CSART','eao',0.31),...
    struct('tracker','C-RPN','eao',0.273),...
    struct('tracker','GradNet','eao',0.247),...
    struct('tracker','SiamRPN','eao',0.245),...
    struct('tracker','SA-Siam','eao',0.237),...
    struct('tracker','SiamFCRes','eao',0.233),...
    struct('tracker','SiamTri','eao',0.213),...
    struct('tracker','CSRDCF++','eao',0.212),...
    struct('tracker','SiamFC','eao',0.182),...
    struct('tracker','ECO-HC','eao',0.177),...
    struct('tracker','Staple','eao',0.17),...
    struct('tracker','KFebT','eao',0.169),...
    struct('tracker','ASMS','eao',0.167),...
    struct('tracker','SSKCF','eao',0.164),...
    struct('tracker','CSRDCFf','eao',0.158),...
    struct('tracker','UCT','eao',0.145),...
    struct('tracker','MOSSEca','eao',0.139),...
    struct('tracker','SiamDCF','eao',0.135),...
    struct('tracker','KCF','eao',0.134),...
    struct('tracker','FoT','eao',0.13),...
    struct('tracker','SAPKLTF','eao',0.126),...
    struct('tracker','DPT','eao',0.126),...
    struct('tracker','MSSA','eao',0.124),...
    struct('tracker','CHT','eao',0.123),...
    struct('tracker','ATLAS','eao',0.117),...
    struct('tracker','LDES','eao',0.113),...
    struct('tracker','CSRDCF','eao',0.099),...
    struct('tracker','Struck2011','eao',0.093),...
    struct('tracker','GMDnetN','eao',0.079),...
    struct('tracker','CMT','eao',0.079),...
    struct('tracker','RCPF','eao',0.078),...
    struct('tracker','ECO','eao',0.078),...
    struct('tracker','DSST','eao',0.077),...
    struct('tracker','GMD','eao',0.076),...
    struct('tracker','CGS','eao',0.075),...
    struct('tracker','HMMTxD','eao',0.074),...
    struct('tracker','MEEM','eao',0.072),...
    struct('tracker','MLT','eao',0.069),...
    struct('tracker','SPCT','eao',0.069),...
    struct('tracker','CRT','eao',0.068),...
    struct('tracker','FragTrack','eao',0.068),...
    struct('tracker','IVT','eao',0.065),...
    struct('tracker','CFWCF','eao',0.062),...
    struct('tracker','L1APG','eao',0.062),...
    struct('tracker','Gnet','eao',0.06),...
    struct('tracker','MCPF','eao',0.06),...
    struct('tracker','MCCT','eao',0.06),...
    struct('tracker','CFCF','eao',0.059),... 
    struct('tracker','ANT','eao',0.059),...
    struct('tracker','LGT','eao',0.059),...
    struct('tracker','CCOT','eao',0.058),...
    struct('tracker','SRDCF','eao',0.058),...
    struct('tracker','DLST','eao',0.057),...
    struct('tracker','LSART','eao',0.055),...
    struct('tracker','LTFLO','eao',0.054),...
    struct('tracker','BST','eao',0.052),...
    struct('tracker','FSTC','eao',0.051),...
    ];

...........
figure;
Maker_style = {'o','x','*','v','diamond','+','<','pentagram','>','square','^','hexagram'};
Color_style = hsv(7);

for i = 1:num_tracker
    if i == 1 || i == 3
        m(i) = plot(i,results(i).eao,'Marker','.','Color',Color_style(i,:),...
            'LineStyle','none','LineWidth',2,'MarkerSize',35);hold on;
    else
        m(i) = plot(i,results(i).eao,'Marker',Maker_style{mod(i-1,12)+1},'Color',Color_style(mod(i-1,7)+1,:),...
            'LineStyle','none','LineWidth',2,'MarkerSize',10);hold on;
    end
    plot([i,i],[0,results(i).eao],'LineStyle',':','Color',[0.83 0.81 0.78]);hold on;
end

set(gca,'xdir','reverse')
ylim([0,0.35]);
%ylim([0,(eao_sorted(1)+0.05)]);
xlim([1, num_tracker+1]);
set(gca,'XTick',1:5:70);
set(gca,'YTick',0:0.05:(0.35))
set(gca,'linewidth',2);
set(gca,'FontSize',12);
title('EAO Scores Rank on VOT2017 Real-Time', 'FontName','Times New Roman','FontSize',14)
annotation('textbox',[.15,.76,.1,.1],'String','$$\hat{\Phi}$$','FontWeight','bold','FontSize',30,'LineStyle','none','Interpreter','latex','FitBoxToText','off')
box on

num_tracker_show = 12; % only write top10
% for i = 1:num_tracker_show %
%     legend_names{i} = [strrep(tracker_names{i},'_','\_'),...
%         num2str(eao_sorted(i),'~[%0.3f]')];
% end
% legend(m(1:num_tracker_show),legend_names(1:num_tracker_show),...
%     'Location','eastoutside','Interpreter', 'latex','FontSize',16)

legend(m(1:num_tracker_show),{'\textbf{CSART [0.312]}', 'C-RPN [0.273]', 'GradNet [0.247]', 'SiamRPN [0.245]', 'SA-Siam [0.237]', 'SiamFCRes [0.233]',...
    'SiamTri [0.213]', 'CSRDCF++ [0.212]', 'SiamFC [0.182]', 'ECO-HC [0.177]', 'Staple [0.170]', 'KFebT [0.169]'},...
    'Location','eastoutside','Interpreter', 'latex','FontSize',12.5)
    
set(gcf, 'position', [500 300 800 250]);
saveas(gcf,'../img/eao_vot2017rt','pdf');
saveas(gcf,'../img/eao_vot2017rt','png');
