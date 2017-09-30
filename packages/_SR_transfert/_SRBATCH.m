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

;%SRBATCH^INT^1^59547,73891^0
SRBATCH ;
 
 
 
 
 
 N SA
CHS 
 D CLEPAG^%VVIDEO,^%VZCDB($$^%QZCHW("Choisissez une definition de transfert"),0)
 S SA=$$UN^%PKCHOIX($$ADRS^%SRDESTI,30,3,17)
 Q:SA=""
 D CONTROLE(SA)
 G CHS
 
CONTROLE(SA) 
 N GLO,CONT,STO,ACTRT,TRT,VISU,VIS,NUMGR
 D CLEPAG^%VVIDEO
 D ^%VZCDB(SA_" : "_$$^%QZCHW("Controles des valeurs saisies"),0)
 S GLO=$$ADR^%SRCOMP(SA)
 
 S VISU=0,VIS=1
 Q:'($$GO(.CONT,.STO,.ACTRT,.TRT))
 G DEBUT
 
EXTERNE(SA,CONT,STO,ACTRT,TRT,NUMGR) 
 N GLO,VISU,VIS
 S VISU=0,VIS=0
 S GLO=$$ADR^%SRCOMP(SA)
DEBUT N Y,GLOV,GLOK,GLNOK,GLNOKE,GLIND,GLV,CLE,NBCLE,I,ADCONT
 N %T,MERR,MERCONT,TEMPO,TEMPOK,ADRCOMP,DATE,V
 
 S GLOV=$$ADR^%SRACTIV(SA)
 
 S GLOK=$$ADROK(SA)
 S NUMGR=$ZP(@GLOK@(""))+1
 S GLNOK=$$ADRNOK(SA)
 S I=$ZP(@GLNOK@(""))+1
 
 I I>NUMGR S NUMGR=I
 S GLOK=$$CONCAT^%QZCHAD(GLOK,NUMGR)
 S GLNOK=$$CONCAT^%QZCHAD(GLNOK,NUMGR)
 S DATE=$$TEMPS^%QMDATE
 S TEMPO=$$TEMP^%QZCHAD($P($ZPOS,"^",2),"") K @(TEMPO)
 S TEMPOK=$$CONCAS^%QZCHAD(TEMPO,"OK")
 S ADCONT=$S(CONT=0:"SANSCO^%SRBATCH",1:"AVECCO^%SRBATCH")
 S MERCONT=$$^%QZCHW("Erreur au niveau des controles")
 I VIS D CLEPAG^%VVIDEO,^%VZCDB(SA_" : "_$$^%QZCHW("Recuperation des valeurs correctes"),0)
 S CLE=$E(GLOV,1,$L(GLOV)-1)
 D ADR^%QCAGTW(CLE,ADCONT)
 G DKBMS
 
AVECCO 
 N VAL,OK,LC,TO,OKTOT,VA,I
 S V=$P(%T,CLE,2),V=$E(V,2,$L(V)-1)
 W:VIS !,V," "
 S VA=@%T,LC=$L(VA,$C(0))
 F %I=1:1:LC S VAL(%I)=$P(VA,$C(0),%I)
 D:'($D(^%PKREAD)) READ^%PKGLOB
 S I=1
 X ^%PKREAD("VGRILG")
 I OKTOT S @TEMPOK@(V)=VA W:VIS "Ok" Q
 S @GLNOK@("E",V,"   1")=MERCONT
 W:VIS MERCONT
 Q
 
SANSCO 
 S V=$P(%T,CLE,2),V=$E(V,2,$L(V)-1)
 W:VIS !,V
 S @TEMPOK@(V)=@%T
 Q
 
DKBMS 
 G:'(STO) FIN
 
 S GLIND=$$CONCAS^%QZCHAD(GLOK,"I")
 I VIS D CLEPAG^%VVIDEO,^%VZCDB(SA_" : "_$$^%QZCHW("Controles et stockage dans DKBMS"),0)
 I ACTRT&('(VIS)),'($$VALITRT(TRT,.MERR)) S @GLNOK@("G","   1")=MERR G FIN
 S OKTOT=1
 S GLOERR=$$CONCAS^%QZCHAD(GLNOK,"G"),NOER=1
 S GLNOKE=$$CONCAS^%QZCHAD(GLNOK,"E")
 S ADRCOMP=$$ADRC^%SRSTVAL(SA)
 X @ADRCOMP@("GEN")
 G:OKTOT DK
 D MESS^%PKUTIL(0,3,$$^%QZCHW("les verifications generales sur le modele sont negatives"),1)
 S DX=0,DY=5 X XY
 G FIN
 
DK 
 S CLES=""
BDK S CLES=$O(@TEMPOK@(CLES))
 G:CLES="" FIN
 W:VIS !,CLES," "
 I $$^%SRSTOCK(SA,@TEMPOK@(CLES),STO,ACTRT,TRT,GLNOKE,.VAL,CLES) S @GLOK@("E",CLES)=@TEMPOK@(CLES),GLV=CLE_","_CLES_")" K @(GLV) W:VIS "Ok" G BDK
 W:VIS MERR
 G BDK
 
FIN I $D(@GLOK) S @GLOK=DATE
 I $D(@GLNOK) S @GLNOK=DATE
 K @(TEMPO)
 Q
 
GO(CONT,STO,ACTRT,TRT) 
 N M1,Y,X,%R,OUI,NON
 S OUI=$$^%QZCHW("oui")
 S NON=$$^%QZCHW("non")
 S M1=$S(@GLO@("EXEC.UCONT")="B":$$^%QZCHW("Les valeurs saisies doivent etre controlees. OK ?"),1:$$^%QZCHW("Les valeurs ont deja ete controlees lors de la saisie. Doit-on les recontroler")_" ?")
 S Y(1)=OUI,Y(2)=NON
 S DX=0,DY=3 X XY W M1
DMD1 S %R=5
 S Y="27\CLYHD\2\\\"
 D ^%PKPOP
 Q:(CTR="A")!(CTR="F") 0
 G:CTR'="" DMD1
 S CONT=$S(X=1:1,1:0)
 S DX=0,DY=7 X XY W $$^%QZCHW("Lors des controles, doit-on activer un traitement d'acceptation")," ?"
DMD2 S %R=9
 S Y="27\CLYHD\2\\\"
 D ^%PKPOP
 Q:(CTR="A")!(CTR="F") 0
 G:CTR'="" DMD2
 S ACTRT=$S(X=1:1,1:0)
 I ACTRT=0 S TRT="" G DMDSTO
DMDTRT S TRT="SAISIE."_SA
 S DY=12
DMDTRT2 S X=$$VAL^%PKUTIL(10,13,$$^%QZCHW("Nom du traitement")_" : ",35,.TRT)
 Q:X=0 0
 I TRT="" X ^%PKREAD(7) G DMDTRT
 I TRT="?" S TRT=$$UN^%PKCHOIX("^[QUI]TTL",5,5,15) G DMDTRT2
 G:$$VALITRT(TRT,.MERR) DMDSTO
 D MESS^%PKUTIL(45,14,MERR,1)
 G DMDTRT
DMDSTO S DX=0,DY=DY+4 X XY W $$^%QZCHW("Apres controle, doit-on stocker les valeurs dans DKBMS")," ?"
DMD3 S %R=DY+2
 S Y(1)=NON,Y(2)=OUI
 S Y="27\CLYHD\2\\\"
 D ^%PKPOP
 Q:(CTR="A")!(CTR="F") 0
 G:CTR'="" DMD3
 S STO=$S(X=1:0,1:1)
 Q 1
 
 
VALITRT(TRT,MERR) 
 I '($$EXISTE^%TLGEST(TRT)) S MERR=TRT_" : "_$$^%QZCHW("traitement inexistant") Q 0
 I '($$OKANA^%TLGEST(TRT)) S MERR=TRT_" : "_$$^%QZCHW("traitement non analyse") Q 0
 Q 1
 
 
ADROK(SA) 
 N A
 S A=$$CONCAT^%QZCHAD("^[QUI]SRTOK",""""_SA_"""")
 Q A
 
ADRNOK(SA) 
 N A
 S A=$$CONCAT^%QZCHAD("^[QUI]SRTNOK",""""_SA_"""")
 Q A

