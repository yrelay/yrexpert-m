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

;%VCOMPRQ^INT^1^59547,74034^0
GECOMPRQ ;
 D ^%VGETSCR Q:'($D(^SC($J)))
DEB S SCR="" F %I=1:1 S SCR=$O(^SC($J,SCR)) Q:SCR=""  W !,SCR S PB=0 D COMP(SCR) W $S('(PB):" OK !",1:" Probleme !")
 Q
ALL K ^SC($J) S SCR="" F %U=1:1 S SCR=$O(^%SCRE(SCR)) Q:SCR=""  I SCR'[",COMMENT" S ^SC($J,SCR)=""
 G DEB
COMP(SC) 
 K TAT,KEY,VAL S NK=0,NV=0
 S GLO=$S($D(^%SCRE(SC,"GLOSTOC")):^%SCRE(SC,"GLOSTOC"),1:"^[QUI]"_SC),%W="" F %I=1:1 S %W=$O(^%SCREINV(2,SC,%W)) Q:%W=""  S RF=^%SCREINV(2,SC,%W) K @("^%SCREINV(1,"_RF_")")
 K ^%SCREINV(2,SC) S %NU=0 I ($D(^%SCRE(SC))#10)'=1 S PB=1 Q
 S %V=^%SCRE(SC) F %U=1:1:%V D TR G:PB=1 FIN
 G FIN:'($D(TAT)) S %NU=1,QU="" F %U=1:1 S QU=$O(TAT(QU)) G:QU="" FIN S ATT="" F %U=1:1 S ATT=$O(TAT(QU,ATT)) Q:ATT=""  D AFF
FIN Q
AFF S IRF=""""_QU_""","""_ATT_""","""_SC_""","
 D AF("""GLOBAL""",GLO) S K1="" F %W=1:1 S K1=$O(KEY(K1)) Q:K1=""  S V=$S($D(KEY(K1,QU)):KEY(K1,QU),1:KEY(K1,"*")) D AF("""CLE"","_K1,V)
 S K1="" F %W=1:1 S K1=$O(VAL(K1)) Q:K1=""  S V=$S($D(VAL(K1,QU)):VAL(K1,QU),1:VAL(K1,"*")) D AF("""VAL"","_K1,V)
 G QUIT
AF(SUB,VAL) 
 S @("^%SCREINV(1,"_IRF_SUB_")")=VAL,^%SCREINV(2,SC,%NU)=IRF_SUB,%NU=%NU+1
 G QUIT
TR G KEY:($D(^%SCRE(SC,%U))#10)=1,VAL
KEY S NK=NK+1,NC=NK,KV="KEY" G TR1
VAL S NV=NV+1,NC=NV,KV="VAL" G TR1
TR1 G LI:$D(^%SCRE(SC,%U,"LIEN")),QU:$D(^%SCRE(SC,%U,"QUERY"))
 S @KV@(NC,"*")="" G QUIT
QU S QU=""
QU1 S QU=$O(^%SCRE(SC,%U,"QUERY",QU)) G:QU="" QUIT S RF=^%SCRE(SC,%U,"QUERY",QUZ),ATT=$P(RF,"~",1),ID=$P(RF,"~",2)
 I KV="VAL" S @KV@(NC,QU)="V",TAT(QU,ATT)="" G QU1
 D ^%QZCHEXP($$ZSUBST^%QZCHSUB(ID,"_",","),"I","TB") S @KV@(NC,QU)=$S($D(TB(%U)):TB(%U),1:"V"),TAT(QU,ATT)="" G QU1
LI G QUIT
LI1 S QU=$O(^%SCRE(SC,%U,"LIEN",QU)) G:QU="" QUIT S RF=^%SCRE(SC,%U,"LIEN",QU),LI=$P(RF,",",1) I '($D(^%QSNOINT(LI))) S PB=1 G QUIT
 S ATT=^%QSNOINT(LI),ID=$P(RF,",",2) I KV="VAL" S @KV@(NC,LI)="V" G LI2
 D ^%QZCHEXP($$ZSUBST^%QZCHSUB(ID,"_",","),"I","TB") S @KV@(NC,LI)=$S($D(TB(%U)):TB(%U),1:"V"),TAT(LI,ATT)=""
LI2 S LI=$P(RF,",",4) I '($D(^%QSNOINT(LI))) S PB=1 G QUIT
 S ATT=^%QSNOINT(LI),ID=$P(RF,",",5) I KV="VAL" S @KV@(NC,QU)="V" G LI1
 D ^%QZCHEXP($$ZSUBST^%QZCHSUB(ID,"_",","),"I","TB") S @KV@(NC,LI)=$S($D(TB(%U)):TB(%U),1:"V"),TAT(LI,ATT)=""
 G LI1
QUIT Q

