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
;! Nomprog     : %MZREP                                                       !
;! Module      : MOZART                                                       !
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

;%MZREP^INT^1^59547,73872^0
MOZREP(X,Y) 
 
 
 
 
 
 
 
 
 
 
 
 
 
 N CPT,%U,REP,NG,LNG D CPT
 I CPT=0 D AFF("GAMME","MOZ","OPERATION.MOZART","MOZOP") G FIN
 I CPT=1 S NG=$O(^TABIDENT(WHOIS,"MOZART","")) G GET
 D CH
GET 
 F %U="GE","OE" S @%U=^TABIDENT(WHOIS,"MOZART",NG,%U)
 D AFF(GE,$$NOMINT^%QSF(GE),OE,$$NOMINT^%QSF(OE)) G FIN
AFF(GE1,GI1,OE1,OI1) 
 K ^MOZIDF($I,WHOIS) S ^MOZIDF($I,WHOIS,"GE")=GE1,^MOZIDF($I,WHOIS,"GI")=GI1,^MOZIDF($I,WHOIS,"OE")=OE1,^MOZIDF($I,WHOIS,"OI")=OI1 G FIN
 
CPT 
 S LNG=0,NG="" F CPT=0:1 S NG=$O(^TABIDENT(WHOIS,"MOZART",NG)) Q:NG=""  S LNG=$S($L(NG)>LNG:$L(NG),1:LNG)
 S ^TABIDENT(WHOIS,"MOZART")=CPT
FIN Q
 
OBT(NG) 
 N %U,GE,GI,OE,OI G GET
CH D INIT^%QUCHOIP("^TABIDENT(WHOIS,""MOZART"")",1,"",X,Y,LNG+10,CPT+7),AFF^%QUCHOIP
CH0 S NG=$$UN^%QUCHOIP G CH0:NG="" D END^%QUCHOIP Q
 
 
 
SEL 
BEG D CURRENT^%IS S V80=0 I ^MOZETAT($J,"NBCOL")=80 S ^MOZETAT($J,"NBCOL")=132,V80=1 D 132^%VVIDEO
 S:'($D(XOP)) XOP=3 S @%TT@($J,0,EDCL)=XOP_"^"_X,NYS=21 D:(XOP=1)!(XOP=2) NORM^%VVIDEO
DEB N CPT,RG
 O $I D CLFEN^%VVIDEO(80,0,23,50)
 
 D CPT^%MZREP S CPT=^TABIDENT(WHOIS,"MOZART")
 
 
 I CPT=0 D AFF^%MZREP("GAMME","MOZ","OPERATION.MOZART","MOZOP"),MESS G SUIT
 I CPT=1 S RG=$O(^TABIDENT(WHOIS,"MOZART","")) G:RG="" FIN D OBT^%MZREP(RG),MESS G SUIT
 D ^%MZREP(82,5)
SUIT K %U,%V D 132^%VVIDEO,CLFEN^%VVIDEO(80,0,23,50) S DX=80,DY=0 X XY
 I V80 D 80^%VVIDEO S ^MOZETAT($J,"NBCOL")=80
 
 I '(V80) D ^%MZHLP2,NORM^%VVIDEO,STAT1^%MZWORD D:(XOP=1)!(XOP=2) NORM^%VVIDEO
 O 0 Q
MESS D CLFEN^%VVIDEO(80,0,23,50)
 S DX=86,DY=10 X XY W "Le repertoire des gamme  MOZART"
 S DX=86,DY=12 X XY W " est "
 S DX=86,DY=14 X XY W $$GE^%MZQS H 3
 Q

