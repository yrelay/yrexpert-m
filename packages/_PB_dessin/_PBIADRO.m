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

;%PBIADRO^INT^1^59547,73873^0
PTIADROI ;
 
 
 
 
 N ATT,NOM,PA,PD,PAR,R,SYNTAX,TYP,XA,XD,YA,YD,ADRES
DEB S SYNTAX(1)="(X;X)",SYNTAX(2)="(*/*;X;X)",ADRES=1
 I MODE D EFFBAS^%PBMEN
 G @MODE
0 
 D EFFBAS^%PBMEN,AFF^%PBMEN(0,0,"Pointez le point de depart avec la mire")
 D ^%PBPZGRA S R=$$LOC^%PBMFN(.XD,.YD) Q:R=0
 D POINT^%PBMFN(XD,YD,0)
 
 D EFFBAS^%PBMEN,AFF^%PBMEN(0,0,"Pointez le point d'arrivee avec la mire")
 D ^%PBPZGRA S R=$$LOC^%PBMFN(.XA,.YA) I R=0 D POINT^%PBMFN(XD,YD,1) Q
 D DROITE^%PBMFN(XD,YD,XA,YA,0,TYPL,VISIBL)
S0 S ADRES=$$CONFIRM^%PBMEN($$^%QZCHW("Syntaxe")_" (O/N) : ")
 I ADRES G 1
 S (PD,PA)=""
 G EN
1 
L0 D ^%PBPZALF,POCLEPA^%VVIDEO W "Syntaxe : " S DX=$X,DY=$Y D ^%VLEC
E0 I CTRLA D:'(MODE) EFF G FIN
OK 
 G:(Y1="")&MODE FIN I Y1="" S (PA,PD)="" D POCLEPA^%VVIDEO G EN
 I '($$^%PBIANSY(.SYNTAX,Y1,.ATT,.PAR,.TYP)) D POCLEPA^%VVIDEO,^%VSQUEAK W "Syntaxes : (Pd;Pa) ou (Longueur/Angle;Pd;Pa) ... [RETURN]" R *R:^TOZE($I,"ATTENTE") G L0
 S PD=$S(TYP=1:$P($P(Y1,"(",2),";",1),1:$P(Y1,";",2))
 S PA=$P($P(Y1,";",$S(TYP=1:2,1:3)),")",1) G @("S"_TYP)
S1 I MODE&('($$POINT^%PBSOV(O,V,PD))) D POCLEPA^%VVIDEO,^%VSQUEAK W "Le point ",PD," est inconnu dans le dessin ... [RETURN]" R *R:^TOZE($I,"ATTENTE") G L0
 I MODE&('($$POINT^%PBSOV(O,V,PA))) D POCLEPA^%VVIDEO,^%VSQUEAK W "Le point ",PA," est inconnu dans le dessin ... [RETURN]" R *R:^TOZE($I,"ATTENTE") G L0
 D ^%PBPZGRA D:'(MODE) EFF
 D:'($$POINT^%PBSOV(O,V,PD)) ^%PBIAJPO(PD,XD,YD,"","")
 D:'($$POINT^%PBSOV(O,V,PA)) ^%PBIAJPO(PA,XA,YA,"","")
 D XY^%PBSOV(O,V,PD,.XD,.YD),XY^%PBSOV(O,V,PA,.XA,.YA) G END
S2 I MODE D MODE^%PBIZERR G L0
 I '($$^%PBIZLEX(PAR(1))) G L0
 I '($$^%PBIZLEX(PAR(2))) G L0
 I $$POINT^%PBSOV(O,V,PA) D POCLEPA^%VVIDEO,^%VSQUEAK W "Le point ",PA," existe deja ... refuse [RETURN]" R *R:^TOZE($I,"ATTENTE") G L0
 D ^%PBPZGRA D:'(MODE) EFF
 D:'($$POINT^%PBSOV(O,V,PD)) ^%PBIAJPO(PD,XD,YD,"","")
 D ^%PBIAJPO(PA,XA,YA,1,Y1),DEP^%PBSOV(O,V,PA,PD)
 D XY^%PBSOV(O,V,PD,.XD,.YD),XY^%PBSOV(O,V,PA,.XA,.YA) G END
END D DROITE^%PBMFN(XD,YD,XA,YA,0,TYPL,VISIBL)
EN S R=$$ADD^%PBSOV(O,V,$$DROITE^%PBEL(XD,YD,XA,YA,TYPL,PD,PA,Y1))
FIN I MODE D ^%PBPZALF,POCLEPA^%VVIDEO,NORM^%VVIDEO
 I ADRES D ^%PBPZONG,INDIQ^%PBIMCR2
 Q
EFF D ^%PBPZGRA,DROITE^%PBMFN(XD,YD,XA,YA,1,TYPL,VISIBL),POINT^%PBMFN(XD,YD,1),POINT^%PBMFN(XA,YA,1) Q

