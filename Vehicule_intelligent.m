clc;
clear all;

m=1500;%Masse du véhicule
i_eff=0.3*m;%Inertie moteur
i_z=2454;% Inertie verticale
c_f=57500;%Coefficient de raideur du pneu avant
c_r=57500;%Coefficient de raideur du pneu arrière
l_f=1.0065;%distance entre le CG et l’essieu avant
l_r=1.4625;%distance entre le CG et l’essieu arrière
c_x=0.35;%coefficient de la traînée aérodynamique en longitudinal
c_y=0.45;%coefficient de la traînée aérodynamique en latéral
T_r=0;%couple de roulement
%T_t=   couple moteur (traction + freinage)
l_w=40;%
v_x=15;
R=5;% rayon de courbure 

A=[0,1, 0, 0;
   0, -(c_f+c_r)/(m*v_x) (c_f+c_r)/m, (l_r*c_r-l_f*c_f)/(m*v_x);
   0, 0, 0, 1;
    0, -((l_f*c_f-l_r*c_r)/(i_z*v_x)), (l_f*c_f-l_r*c_r)/i_z, -((l_f*l_f*c_f+l_r*l_r*c_r)/(i_z*v_x))]

B1=[0;c_f/m;0;l_f*c_f/i_z]

B2=[0;(c_r*l_r-c_f*l_f)/(m*v_x);0;-((l_f*l_f*c_f+l_r*l_r*c_r)/(i_z*v_x))]

p = [-5+3i -5-3i -7 -10];
K = place(A,B1,p)
eig(A-B1*K)
sim('espace_etat_2017');
X=[e1, e1_point, e2, e2_point]';

