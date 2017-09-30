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

;%SRACTI2^INT^1^59547,73891^0
SRACTIV ;
 
 
 
 
 
 
 N AFFIC,GLO,SA
 S AFFIC=0
 D CLEPAG^%VVIDEO,^%VZCDB($$^%QZCHW("Choisissez un masque de saisie"),0)
 S SA=$$^%PKCHOIX($$ADR^%SRSAIS2,10,3,18)
 Q:SA=""
 S GLO=$$ADR^%SRCOMP(SA)
 G DEB
 
ACT(SA,AFFIC,GLO) 
 
DEB 
 N %C,%R,ERR,DA,GLV,I,MODE,NB,NCLE,PK,TAB,VAL,X,Y,TEMP
 
 S TEMP=$$TEMP^%QZCHAD($P($ZPOS,"^",2),"") K @(TEMP)
 S VAL=$$CONCAS^%QZCHAD(TEMP,"VAL")
 D CLEPAG^%VVIDEO
 I '($D(@GLO)) S %R=12 D PARAM^%PKPOP("25\WCHRL\1\\\Compilation inexistante"),^%VZEAVT("") Q
 D ^%VZCDB($$^%QZCHW(@GLO@("TITRE")),0)
 
 S GLV=$$ADR(SA)
 S @VAL=$P(GLV,")",1)
 
 S NB=@GLO@("NBC")
 
 S NCLE=@GLO@("CLE")
 X @GLO@("DEFAUT")
 I AFFIC G AFFICH
GEN S %R=22
 K Y
 S Y="25\CLH\3\\\Ajouter,Lister,Fin"
 D ^%PKPOP
 I X=3 G FIN
 
 I X=1 S MODE=0 G DEF
 
 S I=$$CHOIX I I="" G GEN
 G DEF
 
MEN S %R=22
 K Y
 S Y="10\CLH\6\\\Ajouter,Modifier,Dupliquer,Supprimer,Lister,Fin"
 D ^%PKPOP
 I X=6 G FIN
 
 I X=5 S I=$$CHOIX G:I'="" DEF D ^%PKAFFI(1,0,1,GLO,VAL,.ERR) G MEN
 
 I X=2 S MODE=1 G DEF
 
 I X=3 D DUP G DEF
 
 I X=4 D SUP,POCLEPA^%VVIDEO G MEN
 
 S MODE=0
 
DEF 
 D ^%PKSAISI(MODE,0,1,0,1,GLO,VAL,.ERR)
 G MEN
 
AFFICH 
 D ^%PKAFFI(0,0,1,GLO,VAL,.ERR)
 
FIN K @(TEMP)
 Q
 
 
CHOIX() 
 D CONS
 S I=$$^%PKCHOIX(TAB,1,3,17) G:I="" FC
 N CH
 S MODE=1,NOM=I
 
 S CH=@TAB@(NOM)
 F I=1:1:NCLE S @VAL@(@GLO@("POSCLE",I))=$P(CH,$C(0),I)
FC Q I
 
CONS 
 N %T,C,CH,P,V,VC
 D ^%VZEATT
 S TAB=$$CONCAS^%QZCHAD(TEMP,"LISTE") K @(TAB)
 
 D ADR^%QCAGTW(@VAL,"INS^%SRACTIV")
 D POCLEPA^%VVIDEO
 Q
INS 
 S V=@%T,CH=""
 S (C,VC)=""
 F I=0:0 S C=$O(@GLO@("POSCLE",C)) Q:C=""  S P=$P(V,$C(0),@GLO@("POSCLE",C)),CH=CH_P_" ",VC=VC_P_$C(0)
 S CH=$E(CH,1,$L(CH)-1),CH=$E(CH,1,75)
 S @TAB@(CH)=$E(VC,1,$L(VC)-1)
 Q
 
SUP 
 I $$POCLE^%PKOUNO($$^%QZCHW("Confirmez-vous la suppression")_" ? ","N")'=1 Q
 N C,GL
 
 S C="",GL=GLV
 F I=1:1 S C=$O(@GLO@("POSCLE",C)) Q:C=""  S GL=$$CONCAS^%QZCHAD(GL,@VAL@(@GLO@("POSCLE",C)))
 K @(GL)
 X @GLO@("DEFAUT")
 D ^%PKAFFI(1,0,1,GLO,VAL,.ERR)
 Q
 
DUP 
 S MODE=2
 Q
 
ADR(SA) 
 Q $$CONCAS^%QZCHAD("^[QUI]RQSGLO(""SR"",""VAL"")",SA)

