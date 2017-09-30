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

;%SRACTIV^INT^1^59547,73891^0
SRACTIV ;
 
 
 
 
 
 
 N CMS
 
 S CMS=0
 G COM
 
CMS(CMS) 
 
 G COM
 
COM N AFFIC,GLO,SA
 S AFFIC=0
CHS 
 D CLEPAG^%VVIDEO,^%VZCDB($$^%QZCHW("Choisissez un masque de saisie"),0)
 S SA=$$UN^%PKCHOIX($$ADR^%SRSAIS2,10,3,17)
 Q:SA=""
 S GLO=$$ADR^%SRCOMP(SA)
 D DEB
 G CHS
 
ACT(SA,AFFIC,GLO) 
 N CMS
 S CMS=0
 
DEB 
 N %C,%R,ERR,DA,GLV,I,MODE,NB,NCLE,PK,TAB,VAL,X,Y,TEMP
 
 S TEMP=$$TEMP^%QZCHAD($P($ZPOS,"^",2),"") K @(TEMP)
 S VAL=$$CONCAS^%QZCHAD(TEMP,"VAL")
 D CLEPAG^%VVIDEO
 I '($D(@GLO)) D MESS^%PKUTIL(25,12,$$^%QZCHW("Compilation inexistante"),1) Q
 D ^%VZCDB($$^%QZCHW(@GLO@("TITRE")),0)
 
 S GLV=$$ADR(SA)
 S @VAL=$P(GLV,")",1)
 
 S NB=@GLO@("NBC")
 
 S NCLE=@GLO@("CLE")
 X @GLO@("DEFAUT")
 I AFFIC G AFFICH
 I CMS=1 G GEN
 I @GLO@("AJOUT")=0 G GEN
 
MEN S %R=22
 K Y
 S Y="25\CLH\2\\\Ajouter,Lister"
 D ^%PKPOP
 G:(CTR="A")!(CTR="F") FIN
 G:CTR'="" MEN
 
 I X=1 S MODE=0 G DEF
 
 S I=$$CHOIX I I'="" D ^%PKAFFI(1,0,1,GLO,VAL,.ERR)
 G MEN
 
 
DEF 
 D ^%PKSAISI(MODE,0,1,0,1,GLO,VAL,.ERR)
 G MEN
 
AFFICH 
 D ^%PKAFFI(0,0,1,GLO,VAL,.ERR)
 
FIN K @(TEMP)
 Q
 
 
CHOIX() 
 D CONS
 S I=$$UN^%PKCHOIX(TAB,1,3,17) G:I="" FC
 N CH
 S NOM=I
 
 S CH=@TAB@(NOM)
 F I=1:1:NCLE S @VAL@(@GLO@("POSCLE",I))=$P(CH,$C(0),@GLO@("POSCLE",I))
FC Q I
 
CONS 
 N %T,CH,V,LIB
 D ^%VZEATT
 S LIB=@VAL
 S TAB=$$CONCAS^%QZCHAD(TEMP,"LISTE") K @(TAB)
 
 D ADR^%QCAGTW(LIB,"INS^%SRACTIV")
 D POCLEPA^%VVIDEO
 Q
INS 
 S V=@%T
 S CH=$P(%T,LIB,2),CH=$E(CH,2,$L(CH)-1)
 S @TAB@($E(CH,1,75))=V
 Q
 
ADR(SA) 
 N AD
 S AD=$$CONCAT^%QZCHAD("^[QUI]RQSGLO(""SR"",""VAL"")",""""_SA_"""")
 Q AD
 
 
 
GEN S %R=22
 K Y
 S Y="25\CLH\2\\\Ajouter,Lister"
 D ^%PKPOP
 G:(CTR="A")!(CTR="F") FIN
 G:CTR'="" GEN
 
 I X=1 S MODE=0 G DEFG
 
 S I=$$CHOIX I I="" G GEN
 S MODE=1
 D ^%PKAFFI(1,0,1,GLO,VAL,.ERR) G MENG
 
DEFG 
 D ^%PKSAISI(MODE,0,1,0,1,GLO,VAL,.ERR)
 
MENG S %R=22
 K Y
 S Y="10\CLH\5\\\Ajouter,Modifier,Dupliquer,Supprimer,Lister"
 D ^%PKPOP
 G:(CTR="A")!(CTR="F") FIN
 G:CTR'="" MENG
 
 I X=1 S MODE=0 G DEFG
 
 I X=2 S MODE=1 G DEFG
 
 I X=3 S MODE=2 G DEFG
 
 I X=4 G:$$SUP GEN G MENG
 
 S I=$$CHOIX,MODE=1
 D ^%PKAFFI(1,0,1,GLO,VAL,.ERR) G MENG
 
SUP() 
 I $$POCLE^%PKOUNO($$^%QZCHW("Confirmez-vous la suppression")_" ? ","N")'=1 D POCLEPA^%VVIDEO Q 0
 N C,GL
 
 S C="",GL=GLV
 F I=1:1 S C=$O(@GLO@("POSCLE",C)) Q:C=""  S GL=$$CONCAS^%QZCHAD(GL,@VAL@(@GLO@("POSCLE",C)))
 K @(GL)
 X @GLO@("DEFAUT")
 D ^%PKAFFI(0,0,1,GLO,VAL,.ERR)
 D POCLEPA^%VVIDEO
 Q 1
 
 
MODIF(SA,CONT,GLS,MODE) 
 N GLO,I,VAL
 S GLO=$$ADR^%SRCOMP(SA)
 D CLEPAG^%VVIDEO
 I '($D(@GLO)) D MESS^%PKUTIL(25,12,$$^%QZCHW("Compilation inexistante"),1) Q
 D ^%VZCDB($$^%QZCHW(@GLO@("TITRE")),0)
 S VAL=$$TEMP^%QZCHAD($P($ZPOS,"^",2),"VALCLE") K @(VAL)
 
 S @VAL=$P(GLS,")",1)
 I MODE=0 G VIS
 
 F I=1:1:@GLO@("CLE") S @VAL@(@GLO@("POSCLE",I))=$P(CONT,$C(0),@GLO@("POSCLE",I))
 
 D ^%PKSAISI(1,0,1,0,1,GLO,VAL,.ERR) G FM
 
VIS N NC
 S NC=@GLO@("NBC")
 F I=1:1:NC S @VAL@(I)=$P(CONT,$C(0),I)
 D ^%PKAFFI(0,0,1,GLO,VAL,.ERR),^%VZEAVT("")
FM K @(VAL)
 Q

