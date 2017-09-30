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

;%PBIADEL^INT^1^59547,73873^0
PTIADELI ;
 N A,ATT,B,C,D,GR,I,IN,PAR,PC,PD,PO,PR,R,R1,R2,SN,SY,XA,XC,XHA,XD,XHD,XR,YA,YC,YHA,YD,YHD,YR,SPR,ADRES S ADRES=1
 I MODE D EFFBAS^%PBMEN
 G @MODE
0 
 
 D EFFBAS^%PBMEN,AFF^%PBMEN(0,0,"Pointez le point de depart avec la mire")
 D ^%PBPZGRA S R=$$LOC^%PBMFN(.XD,.YD) I R=0 G FIN
 D POINT^%PBMFN(XD,YD,0)
 
 D EFFBAS^%PBMEN,AFF^%PBMEN(0,0,"Pointez le point d'arrivee avec la mire")
 D ^%PBPZGRA S R=$$LOC^%PBMFN(.XA,.YA) I R=0 D EFF1 G FIN
 D POINT^%PBMFN(XA,YA,0)
 D HORTO^%PBMFN(XD,YD,XA,YA,.XHD,.YHD,.XHA,.YHA,.A,.B,.C)
 D DROITE^%PBMFN(XHD,YHD,XHA,YHA,0,"M",VISIBL)
 
 D EFFBAS^%PBMEN,AFF^%PBMEN(0,0,"Pointez l'extremite du rayon sur l'axe avec la mire")
L0 D ^%PBPZGRA S R=$$LOC^%PBMFN(.XR,.YR) I R=0 D EFF3 G FIN
 S D=((XR*A)+(YR*B))+C I $$SQROOT^%PBCACV(D*D)>5 D ^%VSQUEAK G L0
 D DROITE^%PBMFN(XHD,YHD,XHA,YHA,1,"M",VISIBL)
 I B'=0 S YR=$P((((-(A))*XR)-C)/B,".",1)
 E  S XR=$P((((-(B))*YR)-C)/A,".",1)
 D CAL
 S PR=$P($$DISTANCE^%PBCACV(XD,YD,XA,YA)/2,".",1)
 S GR=$P($$DISTANCE^%PBCACV(XC,YC,XR,YR),".",1)
 S I=$P($$ANGLE^%PBCACV(XC,YC,XD,YD),".",1)
 D DEMIE^%PBMFN(XC,YC,PR,GR,I,0,TYPL,VISIBL)
S0 S ADRES=$$CONFIRM^%PBMEN($$^%QZCHW("Syntaxe")_" (O/N) : ")
 I ADRES G 1
 S (PD,PO,IN,R1,R2,PC)=""
 G END
1 
 D ^%PBPZALF
 S SPR=PR D CLEPAG^%VVIDEO W "Syntaxe : " S DX=$X,DY=$Y D ^%VLEC
 S PR=SPR
 I CTRLA D EFF4 G FIN
 G:(Y1="")&MODE FIN S (PD,PO,IN,R1,R2,PC)="" G:Y1="" END
 S SY(1)="(X;X/*)",SY(2)="(X/*/*/*)"
 I '($$^%PBIANSY(.SY,Y1,.ATT,.PAR,.SN)) D POCLEPA^%VVIDEO,^%VSQUEAK W "Syntaxe : (Pd;Po/R2) (Pc/R1/R2/Inclinaison) ... [RETURN]" R *R:^TOZE($I,"ATTENTE") G L0
 G @("S"_SN)
S1 S PD=PAR(1),PO=PAR(2),R2=PAR(3)
 I '($$^%PBIZLEX(R2)) G L0
 I MODE&('($$POINT^%PBSOV(O,V,PD))) D POCLEPA^%VVIDEO,^%VSQUEAK W "Le point ",PD," n'existe pas dans le dessin ... [RETURN]" R *R:^TOZE($I,"ATTENTE") G L0
 I MODE&('($$POINT^%PBSOV(O,V,PO))) D POCLEPA^%VVIDEO,^%VSQUEAK W "Le point ",PO," n'existe pas dans le dessin ... [RETURN]" R *R:^TOZE($I,"ATTENTE") G L0
 D ^%PBPZGRA D:'(MODE) EFF4
 D:'($$POINT^%PBSOV(O,V,PD)) ^%PBIAJPO(PD,XD,YD,"","")
 D:'($$POINT^%PBSOV(O,V,PO)) ^%PBIAJPO(PO,XA,YA,"","")
 D XY^%PBSOV(O,V,PD,.XD,.YD)
 D XY^%PBSOV(O,V,PO,.XA,.YA)
 D CAL,DEMIE^%PBMFN(XC,YC,PR,GR,I,0,TYPL,VISIBL) G END
S2 I MODE D MODE^%PBIZERR G L0
 S PC=PAR(1),R1=PAR(2),R2=PAR(3),IN=PAR(4)
 I '($$^%PBIZLEX(R1)) G L0
 I '($$^%PBIZLEX(R2)) G L0
 I '($$^%PBIZLEX(IN)) G L0
 I MODE&('($$POINT^%PBSOV(O,V,PC))) D POCLEPA^%VVIDEO,^%VSQUEAK W "Le point ",PC," n'existe pas dans le dessin ... [RETURN]" R *R:^TOZE($I,"ATTENTE") G L0
 D ^%PBPZGRA D:'(MODE) EFF4
 D:'($$POINT^%PBSOV(O,V,PC)) ^%PBIAJPO(O,V,PC,XC,YC)
 D XY^%PBSOV(O,V,PC,.XC,.YC)
 D DEMIE^%PBMFN(XC,YC,PR,GR,I,0,TYPL,VISIBL) G END
END S R=$$ADD^%PBSOV(O,V,$$DEMIE^%PBEL(XC,YC,PR,GR,I,TYPL,PD,PO,PC,R1,R2,IN,Y1))
FIN D:MODE ^%PBPZALF,POCLEPA^%VVIDEO,NORM^%VVIDEO
 I ADRES D ^%PBPZONG
 Q
EFF1 D POINT^%PBMFN(XD,YD,1) Q
EFF2 D POINT^%PBMFN(XA,YA,1) Q
EFF3 D EFF1,EFF2,DROITE^%PBMFN(XHD,YHD,XHA,YHA,1,"M",VISIBL) Q
EFF4 D EFF1,EFF2,DEMIE^%PBMFN(XC,YC,PR,GR,I,1,TYPL,VISIBL) Q
CAL S XC=$P((XD+XA)/2,".",1),YC=$P((YD+YA)/2,".",1) Q

