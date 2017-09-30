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

;%QULELVT^INT^1^59547,73885^0
%QULELVT ;;04:30 PM  8 Jan 1992;
 
 
TEST N VG,TP,RA,RES,UC,ZZ,RESUL,TABQUL,OCO,PCO,UC2
 S TP=$$TEMP^%QZCHAD($P($ZPOS,"^",2),"TEST") K @(TP)
 S VG=$$CONCAS^%QZCHAD(TP,"G"),RA=$$CONCAS^%QZCHAD(TP,"R"),UC=$$CONCAS^%QZCHAD(TP,"U"),RESUL=$$CONCAS^%QZCHAD(TP,"RS"),UC2=$$CONCAS^%QZCHAD(TP,"U2")
 S @UC@("AUTRE",1)="CTRB^%QULELVT",@UC@("AUTRE",1,"TXT")=$$^%QZCHW("Test"),@UC@("AUTRE",1,"COM")=$$^%QZCHW("Suivre"),@UC@("AUTRE",1,"CTR")="B"
 S @UC@("TRI")="$$POIDS^%QULELVT"
 D MKGL("a",3) S @RA@("a")=""
 S ZZ=1
 S RES=$$INIT^%QULELV(VG,RA,15,7,UC,"",0)
 S OCO="a",PCO=""
UP D RUN^%QULELV1(RES,OCO,PCO,1,0,RESUL)
 I @RESUL@("NUMUC")'=1 G FIN
 S OCO=@RESUL@("O"),PCO=@RESUL@("P")
 I '($D(TABQUL(OCO))) K ROOT S ROOT(OCO)="",TABQUL(OCO)=$$INIT^%QULELV(VG,"ROOT",5,3,UC2,"",0)
 D RUN^%QULELV1(TABQUL(OCO),OCO,"",1,0,RESUL)
 G UP
FIN S OCO="" F U=0:0 S OCO=$O(TABQUL(OCO)) Q:OCO=""  D END^%QULELV(TABQUL(OCO))
 D END^%QULELV(RES) Q
 
MKGL(R,i) Q:i=0  S @VG@(R,R_"a")="" D MKGL(R_"a",i-1) S @VG@(R,R_"b")="" D MKGL(R_"b",i-1) Q
 
 
 
POIDS(A,B) 
 Q $A($E(B,$L(B)))
 
 
CTRB(TP) 
 S FINEXE=1
 Q

