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

;LKYECR2^INT^1^59547,74868^0
LKYECR2(REP,FILS,BDFI,LILI) 
 
 
 
 
 N DAT,DAT2,LILA2,BASE2 K ^DAT
 N BASE,DEBO,END,FIN,FINOI,I,L,LIST,LISTE,LA,LNUM,LT,LVAL,NENREG,NOP,RET
 N LILA,M,ER,MSG,LIEN,ROOT,APP,IO
 S APP="TOLAS",IO=""
 S LNUM=$G(^[QUI]LKY("NUMERIQUE"))+0
 S MSG=$$^LKYVAL2(REP,FILS) Q:MSG'=""
 S BASE=^DAT
 S END="",FIN="" F I=1:1:^DAT(BASE,"L") S FIN=FIN_"!",END=END_"*"
 S NENREG=0
 D SELSUP
SEL S LISTE=LILI
 I LISTE="" D ^%VZEAVT($$^%QZCHW("Impossible de retrouver les individus de cette liste")) G SEL
 S BASE2=$$^%QSCALIN("L0",LIST,"BASE",1)
 I BASE2="" D ^%VZEAVT($$^%QZCHW("Impossible de retrouver le repertoire des individus")) G SEL
 I BASE'=BASE2 D ^%VZEAVT($$^%QZCHW("Les objets de cette base ne sont pas des ")_$$NOMLOG^%QSF(BASE)) G SEL
 I $D(^[QUI]LKY("REP",$$NOMLOG^%QSF(BASE2)))<9 D ^%VZEAVT($$^%QZCHW("le repertoire de cette liste n'est pas defini pour la passerelle, les valeurs par defaut seront utilisees"))
 
 D ^LKYGO(LISTE,BASE,"^DAT")
 D ^LKYGONE(APP,IO)
 D ^%VZEAVT($$^%QZCHW("Transfert termine"))
STOP D END^%QUAPAGM Q
GO(ROOT,IO,LONG) S RET=13 I IO=47 D MES("Veuillez placez la bande dans le lecteur"),POCLEPA^%VVIDEO
 S:RET=-1 RET=1 Q:(RET=1)!(RET=6)
 W $$BLD^%VVIDEO1_$$BLK^%VVIDEO1_$$XY^%VVIDEO1(0,22)_$$^%QZCHW("Un instant ... transfert en cours")_$$NORM^%VVIDEO1
 D TRANSF
 Q
 
TRANSF N %DIR
 I IO'=47 D INT^%DIR S IO=%DIR_IO
 D HERIT^%QAX($I,IO)
 O IO:("EFL":LONG:8000) U IO W:IO=47 *-5 D TRANS W:IO=47 *-5 C IO U 0 Q
TRANS N I,J
 U 0 D POCLEPA^%VVIDEO S DX=0,DY=23
 S J=$O(@ROOT@(1,""))
 F I=1:0 Q:J=""  U IO W @ROOT@(1,J) S J=$O(@ROOT@(1,J)) U 0 X XY W J
 Q
DAT(D) Q $$NUM($P(D*10000,".",1))
NUM(V) N V2 S V2=$E(V,1,LNUM),V2=$E("000000000000000000000000000000000000000000000000000000000000000000000000000000",1,LNUM-$L(V))_V2 Q V2
MES(M) D POCLEPA^%VVIDEO W $$^%QZCHW(M_" ... [RETURN]") R *RET:^TOZE($I,"ATTENTE") Q
SELSUP N SUP S SUP=BDFI
 I SUP=$$^%QZCHW("BANDE") S IO=47 Q
 Q
 D POCLEPA^%VVIDEO S IO=$$^%VZAME1($$^%QZCHW("Nom du fichier : ")) Q

