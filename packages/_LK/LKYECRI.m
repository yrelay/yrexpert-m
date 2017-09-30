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

;LKYECRI^INT^1^59547,74868^0
LKYECRI ;
 
 
 
 
 
 
 
 
 N BASE2,FEN,BASE,I,L,LIST,ADR,TRI,LISTE,RET,M,ER,MSG,LIEN,ROOT,APP,IO,SUP,TEMP,NOMFICH
 S TEMP=$$TEMP^%QZCHAD($P($ZPOS,"^",2),"") K @(TEMP)
 S FEN=$$CONCAS^%QZCHAD(TEMP,"FEN")
 S LISTE=$$CONCAS^%QZCHAD(TEMP,"LISTE")
 S APP="TOLAS",IO=""
 
 S MSG=$$^LKYINIT(.BASE) Q:MSG'=""
 D CLEPAG^%VVIDEO
 
 D SELSUP Q:IO=""
 D ^%VZCD(0,39,0,2,1,0,$$^%QZCHW("ECRITURE")_" "_SUP)
 
 D INIT,AFFICH^%QUAPAGM
SEL S LIST=$$UN^%QUAPAGM G:LIST="" STOP
 
 S TRI=$$^%QSCALVA("L0",LIST,"TRIABLE")
 I TRI="OUI" S ADR=$$ADRLT^%QSGEST7(LIST)
 I TRI'="OUI" S ADR=$$ADRLIS^%QSGEST7(LIST)
 I ADR="" D ^%VZEAVT($$^%QZCHW("Impossible de retrouver les individus de cette liste")) G SEL
 S BASE2=$$BASE^%QSGEST7(LIST)
 I BASE2="" D ^%VZEAVT($$^%QZCHW("Impossible de retrouver le repertoire des individus")) G SEL
 I BASE'="",$$NOMINT^%QSF(BASE)'=BASE2 D ^%VZEAVT($$^%QZCHW("Les objets de cette liste ne sont pas des")_" "_BASE) G SEL
 
 S BASE=^DAT($J)
 D ^LKYGO(ADR,TRI,BASE,"^DAT($J)")
 S ROOT=$$CONCAS^%QZCHAD("^[QUI]LK",APP)
 D GO($$CONCAS^%QZCHAD(ROOT,"D"),IO,^DAT($J,"L"))
 D ^%VZEAVT($$^%QZCHW("Transfert termine"))
STOP D END^%QUAPAGM
 K @(TEMP),^DAT($J),^[QUI]LK("TOLAS")
 Q
 
GO(ROOT,IO,LONG) 
 N OKECR
 S OKECR=$$GET^%SGVAR("ECR")
 S RET=13 I IO=47 D MES("Veuillez placer la bande dans le lecteur"),POCLEPA^%VVIDEO
 S:RET=-1 RET=1 Q:(RET=1)!(RET=6)
 I OKECR W $$BLD^%VVIDEO1_$$BLK^%VVIDEO1_$$XY^%VVIDEO1(0,22)_$$^%QZCHW("Un instant ... transfert en cours")_$$NORM^%VVIDEO1
 I DTM D TRANDTM Q
 D TRANSF
 Q
 
TRANSF N %DIR,HOST,I,J
 S HOST=$$PCONF^%INCASTO("TYPHOST")
 D HERIT^%QAX($I,IO)
 I IO=47 O IO:("EFL":LONG:8000) U IO W *-5
 I IO'=47 O IO:("WN")
 I OKECR U 0 D POCLEPA^%VVIDEO S DX=0,DY=23
 S J=""
 F I=1:0 S J=$O(@ROOT@(J)) Q:J=""  D:OKECR ECR S K="" F II=1:0 S K=$O(@ROOT@(J,K)) Q:K=""  U IO W @ROOT@(J,K)
 I IO=47 U IO W *-5
 C IO U:OKECR 0
 Q
ECR U 0 X XY W J Q
 
 
TRANDTM 
 N I,J
 O IO:(MODE="W":FILE=NOMFICH):8000 E  D:OKECR ^%VZEAVT($$^%QZCHW("FICHIER NON DISPONIBLE")) Q
 I OKECR U 0 D POCLEPA^%VVIDEO S DX=0,DY=23
 S J=""
 F I=1:0 S J=$O(@ROOT@(J)) Q:J=""  D:OKECR ECR S K="" F II=1:0 S K=$O(@ROOT@(J,K)) Q:K=""  U IO W @ROOT@(J,K),!
 U IO W $C(26)
 C IO U:OKECR 0
 Q
 
 
 
MES(M) D POCLEPA^%VVIDEO W $$^%QZCHW(M_" ... [RETURN]") R *RET:^TOZE($I,"ATTENTE") Q
 
 
SELSUP N ORD
 S ORD=$$TABID^%INCOIN("ORDINATEUR")
 I ORD="PDP" S SUP=$$^%QZCHW("BANDE"),IO=47 Q
 D POCLEPA^%VVIDEO
 I DTM S (SUP,NOMFICH)=$$^%VZAME1($$^%QZCHW("Nom de fichier : ")),IO=10 Q
 S SUP=$$^%VZECH2($$^%QZCHW("Support choisi :"),$$^%QZCHW("BANDE"),$$^%QZCHW("FICHIER"))
 I (SUP=1)!(SUP=6) S IO="" Q
 I SUP=$$^%QZCHW("BANDE") S IO=47 Q
 D POCLEPA^%VVIDEO S IO=$$^%VZAME1($$^%QZCHW("Nom du fichier : ")) Q
 
INIT 
 I BASE'="" D ^%QSGES13("L0","BASE",$$NOMINT^%QSF(BASE),1,LISTE)
 S @FEN@("X")=0,@FEN@("Y")=3,@FEN@("L")=80,@FEN@("H")=19
 S @FEN@("B")="L0",@FEN@("A")=$S(BASE="":$$LISTIND^%QSGEST6("L0"),1:LISTE)
 S @FEN@("ATT")=1,@FEN@("AFF")="REAFI^%QS0DP"
 S @FEN@("LR")=13
 S @FEN@("C",1,"T")=$$^%QZCHW("Card."),@FEN@("C",1,"L")=6,@FEN@("C",1,"C")="CARD"
 S @FEN@("C",2,"T")=$$^%QZCHW("Repertoire"),@FEN@("C",2,"L")=15,@FEN@("C",2,"C")="OBJET"
 S @FEN@("C",3,"T")=$$^%QZCHW("Source"),@FEN@("C",3,"L")=12,@FEN@("C",3,"C")="SOURCE"
 S @FEN@("C",4,"L")=16,@FEN@("C",4,"C")="AUTRE"
 S @FEN@("C",5,"T")=$$^%QZCHW("Creation"),@FEN@("C",5,"L")=8,@FEN@("C",5,"C")="DATE.CREATION"
 D INIT^%QUAPAGM(FEN)
 Q
 
 
 
ACTIV(MODAFF,NOM,LIST,NOMFICH) 
 N BASE2,BASE,I,L,TRI,RET,M,ER,MSG,LIEN,ROOT,APP,IO,SUP
 S APP="TOLAS"
 
 S MSG=$$ACTIV^LKYINIT(MODAFF,NOM,.BASE)
 
 S SUP=NOMFICH
 S IO=$S(DTM:10,1:NOMFICH)
 
 D:MODAFF ^%VZCD(0,39,0,2,1,0,$$^%QZCHW("ECRITURE")_" "_SUP)
 
 
 S TRI=$$^%QSCALVA("L0",LIST,"TRIABLE")
 I TRI="OUI" S ADR=$$ADRLT^%QSGEST7(LIST)
 I TRI'="OUI" S ADR=$$ADRLIS^%QSGEST7(LIST)
 
 S BASE=^DAT($J)
 D ^LKYGO(ADR,TRI,BASE,"^DAT($J)")
 S ROOT=$$CONCAS^%QZCHAD("^[QUI]LK",APP)
 D GO($$CONCAS^%QZCHAD(ROOT,"D"),IO,^DAT($J,"L"))
 K ^DAT($J),^[QUI]LK("TOLAS")
 Q

