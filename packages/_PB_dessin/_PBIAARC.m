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

;%PBIAARC^INT^1^59547,73873^0
PTIAARCC ;
 N A,AD,AF,ATT,B,C,D,PA,PAR,PC,PD,R,SN,SY,X,XA,XC,XD,XHA,XHD,YA,YC,YD,YHA,YHD,ADRES S ADRES=1
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
L0 
 D EFFBAS^%PBMEN,AFF^%PBMEN(0,0,"Pointez le centre sur l'axe")
 D ^%PBPZGRA S R=$$LOC^%PBMFN(.XC,.YC) I R=0 D EFF3 G FIN
 S X=((A*XC)+(B*YC))+C I $$SQROOT^%PBCACV(X*X)>5 D ^%VSQUEAK G L0
 D DROITE^%PBMFN(XHD,YHD,XHA,YHA,1,"M",VISIBL)
 I B'=0 S YC=$P((((-(A))*XC)-C)/B,".",1)
 E  S XC=$P((((-(B))*YC)-C)/A,".",1)
 D CAL,ARC^%PBMFN(XC,YC,D,AD,AF,0,TYPL,VISIBL)
S0 S ADRES=$$CONFIRM^%PBMEN($$^%QZCHW("Syntaxe")_" (O/N) : ")
 I ADRES G 1
 S (A,R,PD,PA,PC)=""
 G END
1 
L1 D ^%PBPZALF,POCLEPA^%VVIDEO W "Syntaxe : " S DX=$X,DY=$Y D ^%VLEC
 I CTRLA D EFF4 G FIN
 G:(Y1="")&MODE FIN S (A,R,PD,PA,PC)="" I Y1="" D POCLEPA^%VVIDEO G END
 S SY(1)="(X;X;X)",SY(2)="(X;X/R=*;X)",SY(3)="(X;X/A=*;X)"
 I '($$^%PBIANSY(.SY,Y1,.PAR,.ATT,.SN)) D POCLEPA^%VVIDEO W "Syntaxe : (Pd;Pa;Pc) (Pd;Pa/R=Rayon;Pc) (Pc;Pd/A=Angle;Pa) ... [RETURN]" R *SY:^TOZE($I,"ATTENTE") G L1
 G @("S"_SN)
S1 S PD=ATT(1),PA=ATT(2),PC=ATT(3)
 I MODE&('($$POINT^%PBSOV(O,V,PD))) D POCLEPA^%VVIDEO,^%VSQUEAK W "Le point ",PD," est inconnu dans le dessin ... [RETURN]" R *R:^TOZE($I,"ATTENTE") G L1
 I MODE&('($$POINT^%PBSOV(O,V,PA))) D POCLEPA^%VVIDEO,^%VSQUEAK W "Le point ",PA," est inconnu dans le dessin ... [RETURN]" R *R:^TOZE($I,"ATTENTE") G L1
 I MODE&('($$POINT^%PBSOV(O,V,PC))) D POCLEPA^%VVIDEO,^%VSQUEAK W "Le point ",PC," est inconnu dans le dessin ... [RETURN]" R *R:^TOZE($I,"ATTENTE") G L1
 D ^%PBPZGRA D:'(MODE) EFF4
 D:'($$POINT^%PBSOV(O,V,PD)) ^%PBIAJPO(PD,XD,YD,"","")
 D:'($$POINT^%PBSOV(O,V,PA)) ^%PBIAJPO(PA,XA,YA,"","")
 D:'($$POINT^%PBSOV(O,V,PC)) ^%PBIAJPO(PC,XC,YC,"","")
 D XY^%PBSOV(O,V,PD,.XD,.YD)
 D XY^%PBSOV(O,V,PA,.XA,.YA)
 D XY^%PBSOV(O,V,PC,.XC,.YC)
 D CAL,ARC^%PBMFN(XC,YC,D,AD,AF,0,TYPL,VISIBL) G END
S2 I MODE D MODE^%PBIZERR G L1
 S PD=ATT(1),PA=ATT(2),PC=ATT(4),R=ATT(3)
 I '($$^%PBIZLEX(R)) G L1
 I MODE&('($$POINT^%PBSOV(O,V,PA))) D POCLEPA^%VVIDEO,^%VSQUEAK W "Le point ",PA," est inconnu dans le dessin ... [RETURN]" R *R:^TOZE($I,"ATTENTE") G L1
 I MODE&('($$POINT^%PBSOV(O,V,PD))) D POCLEPA^%VVIDEO,^%VSQUEAK W "Le point ",PD," est inconnu dans le dessin ... [RETURN]" R *R:^TOZE($I,"ATTENTE") G L1
 I $$POINT^%PBSOV(O,V,PC) D POCLEPA^%VVIDEO,^%VSQUEAK W "Le point ",PC," existe deja dans le dessin ... [RETURN]" R *R:^TOZE($I,"ATTENTE") G L1
 D ^%PBPZGRA D:'(MODE) EFF4
 D:'($$POINT^%PBSOV(O,V,PD)) ^%PBIAJPO(PD,XD,YD,"","")
 D:'($$POINT^%PBSOV(O,V,PA)) ^%PBIAJPO(PA,XA,YA,"","")
 D ^%PBIAJPO(PC,XC,YC,2,Y1),DEP^%PBSOV(O,V,PC,PA),DEP^%PBSOV(O,V,PC,PD)
 D XY^%PBSOV(O,V,PD,.XD,.YD)
 D XY^%PBSOV(O,V,PA,.XA,.YA)
 D XY^%PBSOV(O,V,PC,.XC,.YC)
 D CAL,ARC^%PBMFN(XC,YC,D,AD,AF,0,TYPL,VISIBL) G END
S3 I MODE D MODE^%PBIZERR G L1
 S PD=ATT(2),PA=ATT(4),PC=ATT(1),A=ATT(3)
 I '($$^%PBIZLEX(A)) G L1
 I MODE&('($$POINT^%PBSOV(O,V,PD))) D POCLEPA^%VVIDEO,^%VSQUEAK W "Le point ",PD," est inconnu dans le dessin ... [RETURN]" R *R:^TOZE($I,"ATTENTE") G L1
 I MODE&('($$POINT^%PBSOV(O,V,PC))) D POCLEPA^%VVIDEO,^%VSQUEAK W "Le point ",PC," est inconnu dans le dessin ... [RETURN]" R *R:^TOZE($I,"ATTENTE") G L1
 I $$POINT^%PBSOV(O,V,PA) D POCLEPA^%VVIDEO,^%VSQUEAK W "Le point ",PA," existe deja dans le dessin ... [RETURN]" R *R:^TOZE($I,"ATTENTE") G L1
 D ^%PBPZGRA D:'(MODE) EFF4
 D:'($$POINT^%PBSOV(O,V,PC)) ^%PBIAJPO(PC,XC,YC,"","")
 D:'($$POINT^%PBSOV(O,V,PD)) ^%PBIAJPO(PD,XD,YD,"","")
 D ^%PBIAJPO(PA,XA,YA,3,Y1),DEP^%PBSOV(O,V,PA,PC),DEP^%PBSOV(O,V,PA,PD)
 D XY^%PBSOV(O,V,PD,.XD,.YD)
 D XY^%PBSOV(O,V,PA,.XA,.YA)
 D XY^%PBSOV(O,V,PC,.XC,.YC)
 D CAL,ARC^%PBMFN(XC,YC,D,AD,AF,0,TYPL,VISIBL) G END
END S R=$$ADD^%PBSOV(O,V,$$ARC^%PBEL(XC,YC,D,AD,AF,TYPL,PD,PA,PC,A,R,Y1))
FIN I MODE D ^%PBPZALF,POCLEPA^%VVIDEO,NORM^%VVIDEO
 I ADRES D ^%PBPZONG
 Q
CAL S D=$P($$DISTANCE^%PBCACV(XC,YC,XD,YD),".",1)
 S AD=$P($$ANGLE^%PBCACV(XC,YC,XD,YD),".",1)
 S AF=$P($$ANGLE^%PBCACV(XC,YC,XA,YA),".",1) Q
EFF1 D POINT^%PBMFN(XD,YD,1) Q
EFF2 D POINT^%PBMFN(XA,YA,1) Q
EFF3 D EFF1,EFF2,DROITE^%PBMFN(XHD,YHD,XHA,YHA,1,"M",VISIBL) Q
EFF4 D EFF1,EFF2,ARC^%PBMFN(XC,YC,R,AD,AF,1,TYPL,VISIBL) Q

