;!----------------------------------------------------------------------------!
;!                                                                            !
;! Licence et conditions d'utilisation                                        !
;! Yexpert : (your) Systeme Expert sous Mumps GT.M et GNU/Linux               !
;! Copyright (C) 2001-2015 by Hamid LOUAKED (HL).                             !
;!                                                                            !
;! Hamid LOUAKED                                                              !
;! 10, impasse Faraday                                                        !
;! 78520 LIMAY                                                                !
;! France                                                                     !
;!                                                                            !
;! yexpert@yrelay.fr                                                          !
;! http://www.yrelay.fr/                                                      !
;!                                                                            !
;! Ce programme est un logiciel libre ; vous pouvez le redistribuer           !
;! et/ou le modifier conformement aux dispositions de la Licence Publique     !
;! Generale GNU, telle que publiee par la Free Software Foundation ;          !
;! version 3 de la licence, ou encore (a votre choix) toute version ulterieure.
;!                                                                            !
;! Ce programme est distribue dans l'espoir qu'il sera utile,                 !
;! mais SANS AUCUNE GARANTIE ; sans meme la garantie implicite de             !
;! COMMERCIALISATION ou D'ADAPTATION A UN OBJET PARTICULIER.                  !
;! Pour plus de details, voir la Licence Publique Generale GNU.               !
;!                                                                            !
;! Un exemplaire de la Licence Publique Generale GNU doit etre fourni avec    !
;! ce programme ; si ce n'est pas le cas,                                     !
;! ecrivez a la Free Software Foundation Inc.,                                !
;! 675 Mass Ave, Cambridge, MA 02139, Etats-Unis.                             !
;!                                                                            !
;! Ce logiciel est telechargeable a l'adresse http://www.yrelay.fr/ ;         !
;! vous trouverez egalement, sur ce site, un mode d'emploi complet            !
;! et des informations supplementaires.                                       !
;!                                                                            !
;!----------------------------------------------------------------------------!
;!                                                                            !
;! GNU General Public License : http://www.gnu.org/copyleft/gpl.html          !
;!                                                                            !
;! Traduction francaise : http://dachary.org/loic/gpl-french.pdf              !
;!                                                                            !
;!----------------------------------------------------------------------------!

;!============================================================================!
;! Nomprog     :                                                              !
;! Module      :                                                              !
;! But         :                                                              !
;!                                                                            !
;! Description :                                                              !
;!                                                                            !
;!                                                                            !
;!                                                                            !
;!                                                                            !
;!                                                                            !
;!----------------------------------------------------------------------------!
;! Modif ! Auteur ! Date     ! Commentaires                                   !
;!-------!--------!----------!------------------------------------------------!
;!       ! HL     ! 22/03/01 ! Creation                                       !
;! HL001 ! HL     ! 00/00/00 ! Description succincte de la modification.      !
;! HL002 ! HL     ! 00/00/00 !                                                !
;!-------!--------!----------!------------------------------------------------!
;!============================================================================!

;%EDCIGP^INT^1^59547,73869^0
EDCIGP ;
 
 
 
 
 
 
DEB 
 N HT
 I %9T<37 D @%9T Q
 I %9T="CLEAR" D @%9T
 Q
 
1 G 17
2 G 19
3 G 20
4 G 21
5 G 22
6 G 23
7 G 25
8 G 26
9 G 28
10 G 29
11 G 30
12 G 31
13 G 32
14 G 33
15 G 34
16 G 36
17 D POLICE(1,1)
 D D12
 Q
18 D POLICE(1,1)
 D D12
 Q
19 D POLICE(1,1)
 D D10
 Q
20 D POLICE(1,1)
 D D10
 Q
21 D POLICE(1,1)
 D D10
 Q
22 D POLICE(1,1)
 D D15
 Q
23 D POLICE(1,1)
 D D15
 Q
24 D POLICE(1,1)
 D D15
 Q
25 D POLICE(1,1)
 D D15
 Q
26 D POLICE(1,1)
 D D13
 Q
27 D POLICE(1,1)
 D D13
 Q
28 D POLICE(1,1)
 D D13
 Q
29 D POLICE(10,10)
 D D10
 Q
30 D POLICE(5,5)
 D D10
 Q
31 D POLICE(0,0)
 Q
32 D POLICE(1,5)
 D D12
 Q
33 D POLICE(10,1)
 Q
34 D POLICE(1,1)
 D D17
 Q
35 D POLICE(1,1)
 D D17
 Q
36 D POLICE(1,1)
 D D17
 Q
 
CLEAR 
 U %PORT D POLICE(1,1),D10
 Q
D10 
 U %PORT W "~S1"
 Q
D12 
 U %PORT W "~S2"
 Q
D13 
 U %PORT W "~S3"
 Q
D15 
 U %PORT W "~S4"
 Q
D17 
 U %PORT W "~S5"
 Q
DA 
 U %PORT W "~S6"
 Q
DB 
 U %PORT W "~S7"
 Q
POLICE(H,L) 
 S:$L(H)=1 H=0_H
 S:$L(L)=1 L=0_L
 U %PORT W "~M"_H_","_L_",000"
 Q
PLACER 
 N %FONC
 S %FONC="MOUV" D ^%PBPZ
 U %PORT W %9STR
 Q
 
 
 
GRAPH 
 I '($D(^V($J,"%"))) D INIT^%EDCENVL
 D COOR^%EDCENVL
 I %9X1=%9X2 D VERT(%9X1,%9Y1,%9X2,%9Y2,%9EPA) Q
 I %9Y1=%9Y2 D HORI(%9X1,%9Y1,%9X2,%9Y2,%9EPA) Q
 Q
VERT(%9X1,%9Y1,%9X2,%9Y2,%9EP) 
 N %9T S:(%9EP+0)=1E-3 %9EP=1E-2
 
 I %9Y1<%9Y2 S %9Y2=%9Y2-%9Y1 G VERT1
 
 I %9Y1'<%9Y2 S X=%9X1,Y=%9Y1,%9X1=%9X2,%9Y1=%9Y2,%9X2=X,%9Y2=Y,%9Y2=%9Y2-%9Y1
VERT1 I %9X1<%9X2 S %9X2=%9EP G VERT2
 S:%9X1'<%9X2 %9X1=%9X2,%9X2=%9EP
VERT2 Q:(%9X1>194E-1)&(%9O="VERTICALE")
 Q:(%9X1>27)&(%9O="VERTICALE")
 N %FONC,%9X,%9Y S %9X=%9X1,%9Y=%9Y1
 S %FONC="MOUV" D ^%PBPZ
 S %FONC="TRAIT.VERTICAL" D ^%PBPZ Q
HORI(%9X1,%9Y1,%9X2,%9Y2,%9EP) 
 Q:$$OUT
 N %9T S:(%9EP+0)=1E-3 %9EP=1E-2
 I %9X1<%9X2 S %9X2=%9X2-%9X1 G HORI1
 I %9X1'<%9X2 S X=%9X1,Y=%9Y1,%9X1=%9X2,%9Y1=%9Y2,%9X2=X,%9Y2=Y,%9X2=%9X2-%9X1
HORI1 I %9Y1<%9Y2 S %9Y2=%9EP G HORI2
 S:%9Y1'<%9Y2 %9Y1=%9Y2,%9Y2=%9EP
HORI2 N %FONC,%9X,%9Y
 S %9X=%9X1,%9Y=%9Y1
 S %FONC="MOUV" D ^%PBPZ
 S %FONC="TRAIT.HORIZONTAL" D ^%PBPZ Q
CADRE(%9X1,%9Y1,%9X2,%9Y2,X1,Y1,X2,Y2) 
 S X1=$$CONV(%9X1)
 S Y1=$$CONV(%9Y1)
 S X2=$$FORMAT(%9X2)
 S Y2=$$FORMAT(%9Y2)
 Q
TRAIT(%9X1,%9Y1,%9X2,%9Y2,X1,Y1,X2,Y2) 
 S X1=$$CONV(%9X1)
 S Y1=$$CONV(%9Y1)
 S X2=$$CONV(%9X2)
 S Y2=$$CONV(%9Y2)
 Q
FORMAT(Z) 
 N B,E
 S B=$J(Z/254E-2,1,1)
 I (B/10)<10 S B=0_B
 S E=(%9EPA*10)\1
 Q $TR(B_E,".","")
CONV(Z) 
 N B
 S B=$J(Z/254E-2,1,1)
 I (B/10)<10 S B=0_B
 Q $TR(B,".","")
OUT() Q 0

