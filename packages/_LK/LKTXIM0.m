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

;LKTXIM0^INT^1^59547,74868^0
LKTXIM0 ;
 
 
 
FIC N APP,NODE,DATE,FIC
 S APP="INOGAMME",NODE="A1",DATE="D",FIC="INOGAMME.DUMP"
 D ^LKFIC(APP,NODE,DATE,FIC)
 Q
BQS(M) Q  N ER,X,SEL,TEMP,APP,DATE
 S TEMP=$$CONCAS^LKZ("^TEMPORAI($J)",$P($ZPOS,"^",2))
 S SEL=$$CONCAS^LKZ(TEMP,"SEL")
 K @(TEMP)
 S APP="INOGAMME",DATE=$H,FIC="INOGAMME.DUMP"
 D ^LKFIC(APP,NODE,DATE,FIC)
 S ER=$$^LKLO(APP,"A1",H,APP,"A2",H,"LOST","INU^LKTXINU2","","",1)
 S ER=$$^LKLO(APP,"A2",H,APP,"A3",H,"LOLO","INU1^LKTXINU2","","",1)
 S ER=$$^LKRQS(APP,"A3",H,H,"INORQS","INU2^LKTXINU2","","")
 D:M="S" INT^LKLDES(APP,"LNODE^LKTXINU0",DATE)
 K @(TEMP)
 Q
TEST D LKTXINU0 Q
XX S APP="INOGAMME"
 S H="D"
 S ER=$$^LKLO(APP,"A1",H,APP,"A2",H,"LOST","INU^LKTXIM1","","",1)
 
 Q
XY S APP="INOGAMME"
 S H="D"
 S ER=$$^LKLO(APP,"A2",H,APP,"A3",H,"LOLO","INU1^LKTXIM1","","",1)
 Q
XY1 S APP="INOGAMME"
 S H="D"
 S ER=$$^LKLO(APP,"A2",H,APP,"A3",H,"LOST","INU1^LKTXIM1","","",1)
 
 Q
XZ N ER,APP
 S APP="INOGAMME",H="D"
 S ER=$$^LKRQS(APP,"A3",H,H,"IMORQS","INU2^LKTXINU2","","")
 Q
ALL D XX,XY,XZ Q
 
HH N GLO,I,IND
 S IND="" F I=0:0 S IND=$$NXTRI^%QSTRUC8("MOZOP",IND) Q:IND=""  W !,IND D HH1(IND)
 Q
HH1(IND) 
 N RART,ART,RGAMME,GAMME,ROP,NOP
 S ROP="MOZOP",RART="ARTICLE",RGAMME="MOZ"
 S ART=$$^%QSCALVA(ROP,IND,"NOM.ARTICLE") Q:ART=""
 S GAMME=$$^%QSCALVA(ROP,IND,"NOM.GAMME") Q:GAMME=""
 S NOP=$$^%QSCALVA(ROP,IND,"NUMERO.OPERATION") Q:NOP=""
 D PA^%QSGESTI(RART,ART,"NOM",ART)
 D PA^%QSGESTI(RGAMME,ART_","_GAMME,"NOM",GAMME)
 D ADDO^%QSGEST3(RART,ART,GAMME,"GAMME.MOZART",RGAMME,GAMME)
 
 D ADDO^%QSGEST3(RGAMME,ART_","_GAMME,NOP_".001","OPERATION.MOZART",ROP,$P(IND,",",3))
 Q

