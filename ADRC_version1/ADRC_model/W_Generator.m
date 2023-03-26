function [W_in, W, W_Feedb] = W_Generator(f,Input_dim,Output_dim,hidden_dim)
%UNTITLED7 �˴���ʾ�йش˺�����ժҪ
%   �˴���ʾ��ϸ˵��
% �ڲ����Ӿ���
global sparsity
global spectral_radius
%% �ڲ����Ӿ��� Internal connection matrix
W=rand(hidden_dim,hidden_dim)-0.5;
W(rand(hidden_dim,hidden_dim)<sparsity)=0;
radius=max(abs(eig(W)));
W = W * (spectral_radius / radius);
%% ��Ĥ Input Mask
W_in = (rand(hidden_dim, Input_dim)  - 0.5)/5;
%% �������� Feedback connection matrix.
% f is the factor that contral the  feedback intensity.
W_Feedb = f*(rand(hidden_dim, Output_dim) * 2 - 1);
end

