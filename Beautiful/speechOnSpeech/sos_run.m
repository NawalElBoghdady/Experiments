function sos_run
% function sos_run(subject, session)
%% expe_run(subject,phase)
%
% Entry point to the SOS experiment
% Input Args: 
%           subject => subject number 
%           session => 1 or 2
% example: 
% expe_run('1', '1')

rng('shuffle')
run('../defineParticipantDetails.m')

options = sos_options(participant);

%-------------------------------------------------

if ~exist(options.res_foldername, 'dir')
    mkdir(options.res_foldername);
end
if ~exist([options.res_foldername options.res_filename], 'file')
    sos_build_conditions(options);
    % let's get rid of this, it's alwasy inconvenient
% else
%     opt = char(questdlg(sprintf('Found "%s". Use this data?', options.res_foldername),'SOS','OK','Cancel','OK'));
%     if strcmpi(opt, 'Cancel')
%         return
%     end
end

session = 1; % what do we need the session for?

sos_main(options, session);

%------------------------------------------
%% Clean up the path

for i = 1 : length(paths2Add)
    rmpath(paths2Add);
end