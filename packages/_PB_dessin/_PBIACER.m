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

;%PBIACER^INT^1^59547,73873^0
PTIACERC ;
 N ATT,D,PA,PAR,PC,R,RA,SN,SY,XA,XC,YA,YC,ADRES S ADRES=1
 I MODE D EFFBAS^%PBMEN
 G @MODE
0 
 
 D EFFBAS^%PBMEN,AFF^%PBMEN(0,0,"Pointez le centre du cercle avec la mire")
 D ^%PBPZGRA S R=$$LOC^%PBMFN(.XC,.YC) G:R=0 FIN
 D POINT^%PBMFN(XC,YC,0)
 
 D EFFBAS^%PBMEN,AFF^%PBMEN(0,0,"Pointez un point du cercle avec la mire")
 D ^%PBPZGRA S R=$$LOC^%PBMFN(.XA,.YA) I R=0 D EFF1 G FIN
 S D=$P($$DISTANCE^%PBCACV(XC,YC,XA,YA),".",1)
 D CERCLE^%PBMFN(XC,YC,D,0,TYPL,VISIBL)
S0 S ADRES=$$CONFIRM^%PBMEN($$^%QZCHW("Syntaxe")_" (O/N) : ")
 I ADRES G 1
 S (RA,PD,PA)=""
 G END
1 
L0 D ^%PBPZALF,POCLEPA^%VVIDEO W "Syntaxe : " S DX=$X,DY=$Y D ^%VLEC
 I CTRLA D EFF3 G FIN
 G:(Y1="")&MODE FIN S (PC,PA,RA)="" I Y1="" D POCLEPA^%VVIDEO G END
 S SY(1)="(X;X)",SY(2)="(X/*)"
 I '($$^%PBIANSY(.SY,Y1,.ATT,.PAR,.SN)) D POCLEPA^%VVIDEO,^%VSQUEAK W "Syntaxe : (Pd;Pp) (Pd/Rayon) ... [RETURN]" R *R:^TOZE($I,"ATTENTE") G L0
 G @("S"_SN)
S2 I MODE D MODE^%PBIZERR G L0
 S PC=PAR(1),RA=PAR(2),PA=""
 I '($$^%PBIZLEX(RA)) G L0
 I MODE&('($$POINT^%PBSOV(O,V,PC))) D POCLEPA^%VVIDEO,^%VSQUEAK W "Le point ",PC," est inconnu dans le dessin ... [RETURN]" R *R:^TOZE($I,"ATTENTE") G L0
 D ^%PBPZGRA D:'(MODE) EFF3
 D:'($$POINT^%PBSOV(O,V,PC)) ^%PBIAJPO(PC,XC,YC,"","")
 D XY^%PBSOV(O,V,PC,.XC,.YC)
 G SS2
S1 S PC=PAR(1),PA=PAR(2),RA=""
 I MODE&('($$POINT^%PBSOV(O,V,PC))) D POCLEPA^%VVIDEO,^%VSQUEAK W "Le point ",PC," est inconnu dans le dessin ... [RETURN]" R *R:^TOZE($I,"ATTENTE") G L0
 I MODE&('($$POINT^%PBSOV(O,V,PA))) D POCLEPA^%VVIDEO,^%VSQUEAK W "Le point ",PA," est inconnu dans le dessin ... [RETURN]" R *R:^TOZE($I,"ATTENTE") G L0
SS1 D ^%PBPZGRA D:'(MODE) EFF3
 D:'($$POINT^%PBSOV(O,V,PC)) ^%PBIAJPO(PC,XC,YC,"","")
 D:'($$POINT^%PBSOV(O,V,PA)) ^%PBIAJPO(PA,XA,YA,"","")
 D XY^%PBSOV(O,V,PC,.XC,.YC)
 D XY^%PBSOV(O,V,PA,.XA,.YA)
SS2 S D=$P($$DISTANCE^%PBCACV(XC,YC,XA,YA),".",1)
 D CERCLE^%PBMFN(XC,YC,D,0,TYPL,VISIBL) G END
END S R=$$ADD^%PBSOV(O,V,$$CERCLE^%PBEL(XC,YC,D,TYPL,PC,PA,RA,Y1))
FIN I MODE D ^%PBPZALF,POCLEPA^%VVIDEO,NORM^%VVIDEO
 I ADRES D ^%PBPZONG
 Q
EFF1 D POINT^%PBMFN(XC,YC,1) Q
EFF2 D POINT^%PBMFN(XA,YA,1) Q
EFF3 D EFF1,EFF2,CERCLE^%PBMFN(XC,YC,D,1,TYPL,VISIBL) Q

