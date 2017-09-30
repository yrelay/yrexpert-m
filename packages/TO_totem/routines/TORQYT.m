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

;TORQYT^INT^1^59547,74875^0
TORQYT(LATT,LTRANSF) 
 
 
 
 
 
 
 
 N RI,TEMP,MES,SELEC,TRANS,NU,I,NUET,N,LETUDE,ETUDE,TEST
 N PREM,NOML,ADR,SOURCE,AUTRE,IND,CARD
 N %CUK,BASE,BASI,FILS
 S RI=$$RI^TORQXIN,TEMP=$$TEMP^%QZCHAD($P($ZPOS,"^",2),""),MES=""
 S SELEC=$$CONCAS^%QZCHAD(TEMP,"SELEC"),PRIS=$$CONCAS^%QZCHAD(TEMP,"PRIS") K @(TEMP)
 D ETUDE(SELEC)
 S TRANS=$$CONCAS^%QZCHAD(TEMP,"TRANS") K @(TRANS)
 S NU="" F I=1:1 S NU=$O(@SELEC@(NU)) Q:NU=""  D AFFECT^TORQY3
 S NUET="" F N=1:1 S NUET=$O(@TRANS@(NUET)) Q:NUET=""  D ORDRE^TORQY3
 Q
 
ETUDE(GLO) 
 D LISTE^TORQY4(LATT,.LISTE)
 D TORQXMB Q
 
TORQXMB 
 N J
 S:$$^%QSCALVA("L0",LTRANSF,"BASE")'="ETUDE.TOTEM" LETUDE=$$RAVO^%QSGE6(RI,"LISTE",LTRANSF,1)
 S:$$^%QSCALVA("L0",LTRANSF,"BASE")="ETUDE.TOTEM" LETUDE=$$ADRLIS^%QSGEST7(LTRANSF)
SUITE 
 S ETUDE="",PREM=0,CARD=0
 F J=1:1 S ETUDE=$O(@LETUDE@(ETUDE)) Q:ETUDE=""  S TEST=1 D TESTS^TORQYS(ETUDE,.TEST,.MES) S:(TEST=0)&(PREM=0) PREM=1 D:TEST=0 SAVE(ETUDE,.PREM) S:TEST=1 @GLO@(ETUDE)=""
 Q
 
 
SAVE(ETUDE,PREM) 
 N BCL,I,x
 S x="" D M($$^%QZCHW("Impossible de transferer l'etude "_ETUDE)) R *x:10
 I PREM'=1 G SAVE2
 S NOML=$$NOM^%QSGES11("TRF"),ADR=$$STO^%QSGES11(NOML)
 S SOURCE="TRANSFERT TOTEM--> DKBMS",AUTRE="TRANSFERT IMPOSSIBLE"
 D CREER^%QSGES11("ETUDE.TOTEM",NOML,"TRF",CARD,SOURCE,ADR,AUTRE)
 
 D PA^%QSGESTI("L0",LTRANSF,"LISTE.ERREURS",NOML,1)
 S PREM=2
SAVE2 D STOCK^%QSGES11(NOML,ETUDE)
 D PA^%QSGESTI(RI,ETUDE,"MESSAGE.TRANSFERT.TODKBMS",MES,1) Q
 Q
M(M) N Y S Y="20,20\RLWY\1\\\",Y(1)=$E(M_"                                                      ",1,74)_"*" D ^%PKPOP Q

