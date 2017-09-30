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

;%QAX^INT^1^59547,73875^0
ZSY ;
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
M(MOT) Q:MOT="" MOT
 N CODE S CODE=^TOZE($I,"CODSYN") Q:CODE="" MOT
 Q:'($D(^[QUI]ZSYNINV(CODE,MOT))) MOT
 Q $O(^[QUI]ZSYNINV(CODE,MOT,""))
 
 
S(MOT) Q:MOT="" MOT
 N CODE S CODE=^TOZE($I,"CODSYN") Q:CODE="" MOT
 Q:'($D(^[QUI]ZSYNONY(CODE,MOT))) MOT
 Q $O(^[QUI]ZSYNONY(CODE,MOT,""))
 
 
 
SC(MOT,CODE) Q:MOT="" ""
 Q:CODE="" MOT
 Q:'($D(^[QUI]ZSYNONY(CODE,MOT))) MOT
 Q $O(^[QUI]ZSYNONY(CODE,MOT,""))
 
 
 
S2(MOT,CODE) Q:MOT="" ""
 Q:CODE="" ""
 Q:'($D(^[QUI]ZSYNONY(CODE,MOT))) ""
 Q $O(^[QUI]ZSYNONY(CODE,MOT,""))
 
COD() 
 Q ^TOZE($I,"CODSYN")
 
VALID() Q:MOT="" 0
 N CODE
 S CODE=$$COD
 Q $S(CODE="":0,1:1)
IMPR 
 
 
 S ^TOZE(^TABIDENT(WHOIS,"PRINTER"),"CODSYN")=^TOZE($I,"CODSYN") Q
 
IMPRI(SAVI) 
 
 S ^TOZE($I,"CODSYN")=^TOZE(SAVI,"CODSYN") Q
 
HERIT(A,B) S ^TOZE(B,"CODSYN")=$$^%QCAZG("^TOZE(A,""CODSYN"")") Q
 
EXI(COD,SYN) 
 Q $O(^[QUI]ZSYNINV(COD,SYN,""))'=""
 
MAITRE(COD,SYN) 
 Q $O(^[QUI]ZSYNINV(COD,SYN,""))
 
INS(COD,MOT,SYN) 
 S ^[QUI]ZSYNONY(COD,MOT,SYN)="",^[QUI]ZSYNINV(COD,SYN,MOT)=""
 Q
 
SUP(COD,MOT,SYN) 
 K ^[QUI]ZSYNONY(COD,MOT,SYN),^[QUI]ZSYNINV(COD,SYN,MOT)
 Q
 
SUPMOT(MOT) 
 Q:MOT=""
 N C,%C,S,%S
 S C="" F %C=0:0 S C=$O(^[QUI]ZSYNONY(C)) Q:C=""  S S=$O(^[QUI]ZSYNONY(C,MOT,"")) K ^[QUI]ZSYNONY(C,MOT) I S'="" K ^[QUI]ZSYNINV(C,S,MOT)
 Q
 
COPY(WHOIS1,QUI1,COD1,WHOIS2,QUI2,COD2) 
 N MOT,I,SYN
 S MOT=$O(^[QUI1]ZSYNONY(COD1,""))
 F I=0:0 Q:MOT=""  D COPY1 S MOT=$O(^[QUI1]ZSYNONY(COD1,MOT))
 Q
 D ADR^%QCAGLX("^[QUI1]ZSYNONY("_$$S1^%QZCHAD(COD1),"^[QUI2]ZSYNONY("""_$$S1^%QZCHAD(COD2))
 D ADR^%QCAGLX("^[QUI1]ZSYNINV("_$$S1^%QZCHAD(COD1),"^[QUI2]ZSYNINV("""_$$S1^%QZCHAD(COD2))
 Q
COPY1 S SYN=$$S1(QUI1,COD1,MOT)
 D SUP1(QUI2,COD2,MOT,SYN)
 D INS1(QUI2,COD2,MOT,SYN)
 Q
SUP1(QUI,COD,MOT,SYN) 
 K ^[QUI]ZSYNONY(COD,MOT),^[QUI]ZSYNINV(COD,SYN)
 Q
INS1(QUI,COD,MOT,SYN) 
 S ^[QUI]ZSYNONY(COD,MOT,SYN)="",^[QUI]ZSYNINV(COD,SYN,MOT)=""
 Q
S1(QUI,COD,MOT) 
 Q:'($D(^[QUI]ZSYNONY(COD,MOT))) MOT
 Q $O(^[QUI]ZSYNONY(COD,MOT,""))

