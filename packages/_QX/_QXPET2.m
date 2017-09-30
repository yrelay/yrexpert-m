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

;%QXPET2^INT^1^59547,73887^0
%QXPET2 ;
 
 
 
 
 
 
 
 
 
 
AFFICHE 
 S UCO=$$TEMP^%SGUTIL
 S ETU=WHOIS("ETUDE")
 S GARB="^[QUI]ETU("""_ETU_""",""ARBETU"",""ARB"")"
 S @UCO@("GOTO")=""
 S @UCO@("AUTRE",1,"TXT")="individus"
 S @UCO@("AUTRE",1,"COM")="acces aux individus de DKBMS"
 S @UCO@("AUTRE",1)="DKBMS^%QXPET2"
 S @UCO@("AUTRE",2,"TXT")="repertoires"
 S @UCO@("AUTRE",2,"COM")="acces aux repertoire"
 S @UCO@("AUTRE",2)="QSMOVIS^%QXPET2"
 S @UCO@("AUTRE",3,"TXT")="temporaires"
 S @UCO@("AUTRE",3,"COM")="acces attributs temporaires"
 S @UCO@("AUTRE",3)="ATTEMP^%QXPET2"
 S @UCO@("INFO")="$$INFO^%QXPET2"
 S @UCO@("AFFIPLUS")="AFFIPLUS^%QXPET2"
 S TPZ=$$TEMP^%QZCHAD($P($ZPOS,"^",2),"")
 S @TPZ=WHOIS("NDCOUR")
 D ^%QULELU(GARB,GARB,4,3,UCO,"arbre")
 S WHOIS("NDCOUR")=@TPZ
 Q
 
VISU(ETU) 
 N UCO,SAVE,I,%I
 S SAVE=$$TEMP^%SGUTIL
 S I="" F %I=0:0 S I=$O(WHOIS(I)) Q:I=""  S @SAVE@(I)=WHOIS(I) K WHOIS(I)
 S UCO=$$TEMP^%SGUTIL
 D REPRISE^%QXPETU(ETU)
 S GARB="^[QUI]ETU("""_ETU_""",""ARBETU"",""ARB"")"
 S @UCO@("AUTRE",1,"TXT")="base"
 S @UCO@("AUTRE",1,"COM")="acces DKBMS"
 S @UCO@("AUTRE",1)="DKBMS^%QXPET2"
 S @UCO@("AUTRE",2,"TXT")="repertoires"
 S @UCO@("AUTRE",2,"COM")="acces aux repertoires"
 S @UCO@("AUTRE",2)="QSMOVIS^%QXPET2"
 S @UCO@("AUTRE",3,"TXT")="temporaires"
 S @UCO@("AUTRE",3,"COM")="acces attributs temporaires"
 S @UCO@("AUTRE",3)="ATTEMP^%QXPET2"
 S @UCO@("INFO")="$$INFO^%QXPET2"
 S @UCO@("GOTO")=""
 
 S TPZ=$$TEMP^%QZCHAD($P($ZPOS,"^",2),"")
 S @TPZ=WHOIS("NDCOUR")
 D ^%QULELU(GARB,GARB,10,3,UCO,"arbre")
 S I="" F %I=0:0 S I=$O(WHOIS(I)) Q:I=""  K WHOIS(I)
 S I="" F %I=0:0 S I=$O(@SAVE@(I)) Q:I=""  S WHOIS(I)=@SAVE@(I)
 S ^[QUI]ETU(ETU,"NDCOUR")=@TPZ
 K @(SAVE),@(UCO)
 Q
 
DKBMS(TAB) 
 N TPZ
 S TPZ=$$TEMP^%QZCHAD($P($ZPOS,"^",2),"")
 S WHOIS("NDCOUR")=@TPZ
 D MOVETO^%QXPETU(WHOIS("ETUDE"),@TAB@("O"))
 S @TPZ=WHOIS("NDCOUR")
 D ^%QSGBASE
 S MODG=0
 Q
QSMOVIS(TAB) 
 N TPZ
 S TPZ=$$TEMP^%QZCHAD($P($ZPOS,"^",2),"")
 S WHOIS("NDCOUR")=@TPZ
 D MOVETO^%QXPETU(WHOIS("ETUDE"),@TAB@("O"))
 S @TPZ=WHOIS("NDCOUR")
 D ^%QSMOVIS
 S MODG=0
 Q
AFFIPLUS(TAB) 
 N TPZ
 S TPZ=$$TEMP^%QZCHAD($P($ZPOS,"^",2),"")
 S WHOIS("NDCOUR")=@TPZ
 D MOVETO^%QXPETU(WHOIS("ETUDE"),@TAB@("O"))
 S @TPZ=WHOIS("NDCOUR")
 D ^xattri
 S MODG=0
 Q
INFO(TAB) 
 N L
 S L=$$COMMENT^%QXPETU(@TAB@("O"))
 Q 1_$C(0)_1_$C(0)_L
 
ATTEMP(TAB) 
 N TPZ
 S TPZ=$$TEMP^%QZCHAD($P($ZPOS,"^",2),"")
 S WHOIS("NDCOUR")=@TPZ
 D MOVETO^%QXPETU(WHOIS("ETUDE"),@TAB@("O"))
 S @TPZ=WHOIS("NDCOUR")
 D ^%QSATTRI($J,"%",0,10,75,10)
 S MODG=0
 Q
 
 
 
 
GETND(REP,IND,ATT,ORD) 
 N REFA,ND
 S REFA=$$REFA^%QXPGESD(WHOIS("ETUDE"),REP,IND,ATT)
 Q:REFA="" ""
 S ND=$$LASTND2^%QXPPRI7(WHOIS("ETUDE"),WHOIS("NDCOUR"),"VALEURS",REFA,ORD)
 Q ND

