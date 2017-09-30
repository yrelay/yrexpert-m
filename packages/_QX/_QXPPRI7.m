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

;%QXPPRI7^INT^1^59547,73887^0
%QXPPRI7 ;;05:05 PM  31 Jul 1992; 30 Jul 92  6:05 PM ; 07 Aug 92  2:35 PM
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
PUSHMAT2(ETU,NOEUD,NOMMAT,X,Y,VALEUR) 
 N ARB,NOUVND,ND,GLOB
PUSH S ARB="^[QUI]ETU(ETU,""ARB"")"
 S GLOB="^[QUI]ETU(ETU,""ENS"",""M2"","""_NOMMAT_""","""_$$TRQ(X)_""","""_$$TRQ(Y)_""")"
 S @GLOB@(NOEUD)=VALEUR,@ARB@(NOEUD,"G",GLOB)=VALEUR
 I ^[QUI]ETU(ETU,"MOTEUR")="MANUEL" S NOUVND=$$POPND^%QXPETU(ETU) D CRNO^%QARBCON($$ARBETU^%QXPETU(ETU),WHOIS("NDCOUR"),NOUVND,""),SETNDC^%QXPETU(ETU,NOUVND)
 Q
 
 
 
SUPPMAT2(ETU,NOEUD,NOMMAT,X,Y) 
 N ARB,NOUVND,GLOB,ND,VALEUR
 S VALEUR=$C(0) G PUSH
 
 
TRQ(V) N L,X,P S X=V,L=""
TRQ2 S P=$F(X,"""") Q:P=0 L_X S L=L_$E(X,1,P-1)_"""",X=$E(X,P,$L(X)) G TRQ2
 
 
 
 
PULLMAT2(ETU,NOEUD,NOMMAT,X,Y) 
 N ND,GLOB
 S GLOB="^[QUI]ETU(ETU,""ENS"",""M2"","""_NOMMAT_""","""_$$TRQ(X)_""","""_$$TRQ(Y)_""")"
 S ND=$ZP(@GLOB@(NOEUD+1)) Q:ND="" ""
 S ND=@GLOB@(ND) Q ND
 
 
SUIVMAT2(ETU,NOEUD,NOMMAT,X,Y,VALRES) 
 N GLOB,Z,NDP,N
 S GLOB="^[QUI]ETU(ETU,""ENS"",""M2"","""_NOMMAT_""","""_$$TRQ(X)_""")"
 S Z=Y,NDP=NOEUD+1
SV2 S Z=$O(@GLOB@(Z)) Q:Z="" "" S N=$ZP(@GLOB@(Z,NDP)) G:N="" SV2 S VALRES=@GLOB@(Z,N) G:VALRES=$C(0) SV2 Q Z
 
 
 
INMAT2(ETU,NOEUD,NOMMAT,X,Y) 
 N ND,GLOB,V
 S GLOB="^[QUI]ETU(ETU,""ENS"",""M2"","""_NOMMAT_""","""_$$TRQ(X)_""","""_$$TRQ(Y)_""")"
 Q:'($D(@GLOB)) 0
 S ND=$ZP(@GLOB@(NOEUD+1)) Q:ND="" O
 S V=@GLOB@(ND) Q:V=$C(0) 0 Q 1
 
 
LASTND2(ETU,NOEUD,NOMMAT,X,Y) 
 N ND,GLOB
 S GLOB="^[QUI]ETU(ETU,""ENS"",""M2"","""_NOMMAT_""","""_$$TRQ(X)_""","""_$$TRQ(Y)_""")"
 S ND=$ZP(@GLOB@(NOEUD+1)) Q ND
 
 
GLOMAT2(ETU,NOEUD,NOMMAT,X) 
 N TEMP,GLOB,NDP,%I
 S TEMP=$$TEMP^%QZCHAD($P($ZPOS,"^",2),ETU)
 S TEMP=$$CONCAS^%QZCHAD(TEMP,NOEUD)
 S TEMP=$$CONCAS^%QZCHAD(TEMP,NOMMAT)
 S TEMP=$$CONCAS^%QZCHAD(TEMP,X)
 K @(TEMP)
 S Z="",NDP=NOEUD+1
 S GLOB="^[QUI]ETU(ETU,""ENS"",""M2"","""_NOMMAT_""","""_$$TRQ(X)_""")"
 F %I=0:0 S Z=$O(@GLOB@(Z)) Q:Z=""  S V=$ZP(@GLOB@(Z,NDP)) I V'="",@GLOB@(Z,V) S @TEMP@(Z)=""
 Q TEMP
 
 
 
 
PUSHVAL(ETU,NOEUD,NOMATTRI,INDICE,VALEUR) 
 N ARB,NOUVND,GLOB,ND
 S ARB="^[QUI]ETU(ETU,""ARB"")"
 S GLOB="^[QUI]ETU(ETU,""ENS"",""M1"","""_NOMATTRI_""","""_$$TRQ(INDICE)_""")"
 S @GLOB@(NOEUD)=VALEUR,@ARB@(NOEUD,"G",GLOB)=VALEUR
 I ^[QUI]ETU(ETU,"MOTEUR")="MANUEL" S NOUVND=$$POPND^%QXPETU(ETU) D CRNO^%QARBCON($$ARBETU^%QXPETU(ETU),WHOIS("NDCOUR"),NOUVND,""),SETNDC^%QXPETU(ETU,NOUVND)
 Q
 
 
 
 
PULLVAL(ETU,NOEUD,NOMATTRI,INDICE) 
 N ND,GLOB
 S GLOB="^[QUI]ETU(ETU,""ENS"",""M1"","""_NOMATTRI_""","""_$$TRQ(INDICE)_""")"
 S ND=$ZP(@GLOB@(NOEUD+1)) Q:ND="" "" S ND=@GLOB@(ND) Q ND
 ;

