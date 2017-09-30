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

;LKMNTX0^INT^1^59547,74867^0
LKMNTX0 ;
 
 
 
 
 
 
 
 
 
BQS(M,TYPE) 
 N ER,X,SEL,TEMP,APP,H,MSG,REC,MARQUE,BASE,EXTERNE,CTR,SUPPORT,ABORT,GR
 N EXTBANDE,IO
 N MODAFF
 S MODAFF=1
 S TEMP=$$TEMP^%QZCHAD($P($ZPOS,"^",2),"BQS")
 S SEL=$$CONCAS^%QZCHAD(TEMP,"SEL")
 S DATA=$$CONCAS^%QZCHAD(TEMP,"DATA")
 S EXTERNE=$$CONCAS^%QZCHAD(TEMP,"EXTERNE")
 S EXTBANDE=$$CONCAS^%QZCHAD(TEMP,"EXTBANDE")
 K @(TEMP)
 S MSG=""
 S GR(1)=$$LK1^LKMZ(TYPE)
 S GR(2)=$$LK2^LKMZ(TYPE)
 S GR(3)=$$LK3^LKMZ(TYPE)
 S APP=$$APP(TYPE),H=$H
 D CLEPAG^%VVIDEO
 D ^%VZCDB($$^%QZCHW("passerelle")_" "_$S(TYPE="PV":$$^%QZCHW("attribut valeur"),1:$$^%QZCHW("suite de valeurs")),0)
BQS1 D LIRE1^%VREAD($$^%QZCHW("Nom de la passerelle")_" : ","",0,23,.CTR,.REC)
 I REC="?" S REC=$$^%QUCHOIS(GR(1),"")
 I (CTR="A")!(REC="") K @(TEMP) Q
 I ($D(@GR(1)@(REC))#10)=0 D ^%VZEAVT($S(TYPE["X":$$^%QZCHW("la sortie"),1:$$^%QZCHW("la passerelle"))_" "_REC_" "_$$^%QZCHW("n'est pas definie")) G BQS1
 
 I '($D(^[QUI]RQSDON("LK",REC))) G VALER
 I ^[QUI]RQSDON("LK",REC,"ETAT")'="OK" G VALER
 I ^[QUI]RQSDON("LK",REC,"OKNOM")'=1 D ^%VZEAVT($$^%QZCHW("Il manque des attributs NOM ==> vous ne pouvez pas utiliser la passerelle en lecture")) G BQS1
 D ^%VZEATT
 I TYPE="PV" S MSG=$$^LKMNVER(TYPE,.GR,REC,EXTERNE,EXTBANDE,.MARQUE,.SUPPORT,.IO)
 I TYPE="EC" S MSG=$$MM^LKMNVER(TYPE,.GR,REC,EXTERNE,EXTBANDE,.SUPPORT,.IO)
 I MSG'="" D ^%VZEAVT(MSG) K @(TEMP) Q
 S SUPPORT(1)=$S(SUPPORT="F":$$^%QZCHW("fichier"),1:$$^%QZCHW("bande"))
 D ^%VZCDB($$^%QZCHW("lecture")_" "_SUPPORT(1),0)
 
 I SUPPORT="B" G BQS3
 
BQS2 D LIRE1^%VREAD($$^%QZCHW("Fichier")_" : ","",0,23,.CTR,.IO)
 I (CTR="A")!(IO="") K @(TEMP) Q
 I MSG'="" D:MODAFF ^%VZEAVT(MSG) G BQS2
 
BQS3 
 D:MODAFF ^%VZEATT
 I SUPPORT="B" S ABORT=$$LIRE1^LKPRIM(APP,"A1",H,IO,"ASCIIST","PHYMN^LKMNTX1",EXTBANDE) Q:ABORT'=0
 
 I SUPPORT="B" D:TYPE="EC" COP G EXT
 
 I TYPE="EC" D CHARG^LKFIC(APP,"A1",H,IO,@EXTERNE@("NUM")) G EXT
 
 D ^LKFIC(APP,"A1",H,IO)
EXT 
 D:MODAFF CLEPAG^%VVIDEO,^%VZCDB($$^%QZCHW("extraction")_" "_SUPPORT(1),0)
 I TYPE="PV" S ER=$$LKLO1^LKLO(APP,"A1",H,APP,"A2",H,"LOST","MN1^LKMNTX1","","",1,EXTERNE),@EXTERNE@("MARQUE")=MARQUE
 I TYPE="EC" S ER=$$LKLO1^LKLO(APP,"A1",H,APP,"A2",H,"LOST2","MM1^LKMMTX1","","",1,EXTERNE)
 
 D:MODAFF CLEPAG^%VVIDEO,^%VZCDB($$^%QZCHW("stockage dans DKBMS"),0)
 I TYPE="PV" S ER=$$LKRQS1^LKRQS(APP,"A2",H,H,"RQST1","MN2^LKMNTX1","","",EXTERNE)
 I TYPE="EC" S ER=$$LKRQS1^LKRQS(APP,"A2",H,H,"RQST2","MM2^LKMMTX1","","",EXTERNE)
 D:M="S" INT^LKLDES(APP,"LNODE^LKMNTX1",H)
 K @(TEMP)
 Q
VALER D:MODAFF ^%VZEAVT($$^%QZCHW("Cette passerelle n'a pas subi de validation correcte"))
 G BQS1
 
APP(TYPE) 
 I TYPE="PV" Q "GENERAL.2"
 I TYPE="EC" Q "GENERAL.1"
 Q
 
COP 
 
 N GLO,I,J,K,N,TEMP
 D:MODAFF ^%VZEATT
 S TEMP=$$TEMP^%QZCHAD($P($ZPOS,"^",2),"GLO") K @(TEMP)
 S GLO=$$CONCAT^%QZCHAD("^[QUI]LK",$$S1^%QZCHAD(APP)_","_$$S1^%QZCHAD("A1")_","_$$S1^%QZCHAD(H)_",""DATA"","_1)
 D GLOCOP^%QCAGLC(GLO,TEMP)
 K @(GLO)
 S J=0,N=@EXTERNE@("NUM")
 F I=1:N Q:'($D(@TEMP@(I)))  S J=J+1 F K=1:1:N S @GLO@(J,K)=@TEMP@((I+K)-1)
 K @(TEMP) Q
 
 
 
 
ACTIV(MODAFF,TYPE,REC,IO) 
 N ER,X,SEL,TEMP,APP,H,MSG,MARQUE,BASE,EXTERNE,CTR,SUPPORT,ABORT,GR
 N EXTBANDE
 N M
 S M=1,SUPPORT="F"
 S TEMP=$$TEMP^%QZCHAD($P($ZPOS,"^",2),"BQS")
 S SEL=$$CONCAS^%QZCHAD(TEMP,"SEL")
 S DATA=$$CONCAS^%QZCHAD(TEMP,"DATA")
 S EXTERNE=$$CONCAS^%QZCHAD(TEMP,"EXTERNE")
 S EXTBANDE=$$CONCAS^%QZCHAD(TEMP,"EXTBANDE")
 K @(TEMP)
 S MSG=""
 S GR(1)=$$LK1^LKMZ(TYPE),GR(2)=$$LK2^LKMZ(TYPE)
 S GR(3)=$$LK3^LKMZ(TYPE)
 S APP=$$APP(TYPE),H=$H
 D:MODAFF CLEPAG^%VVIDEO
 D:MODAFF ^%VZCDB($$^%QZCHW("passerelle")_" "_$S(TYPE="PV":$$^%QZCHW("attribut valeur"),1:$$^%QZCHW("suite de valeurs")),0)
 D:MODAFF ^%VZEATT
 I TYPE="PV" S MSG=$$^LKMNVER(TYPE,.GR,REC,EXTERNE,EXTBANDE,.MARQUE,.SUPPORT,.IO)
 I TYPE="EC" S MSG=$$ACTEC^LKMNVER(TYPE,.GR,REC,EXTERNE,EXTBANDE,.SUPPORT,.IO)
 I MSG'="" D:MODAFF ^%VZEAVT(MSG) K @(TEMP) Q
 S SUPPORT(1)=$S(SUPPORT="F":$$^%QZCHW("fichier"),1:$$^%QZCHW("bande"))
 D:MODAFF ^%VZCDB($$^%QZCHW("lecture")_" "_SUPPORT(1),0)
 
 G BQS3
 ;
 ;
 ;

