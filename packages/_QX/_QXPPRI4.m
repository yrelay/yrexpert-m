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

;%QXPPRI4^INT^1^59547,73887^0
%QXPPRI4 ;; ; 24 Jul 92 11:23 AM
 
NXTXY(ETU,NOMMAT,X,Y) 
 
 S ARB=$$STO^%QXPPRIM(ETU),ARBETU=$$ARBETU^%QXPPRIM(ETU)
 S GLO=$$TEMP^%QZCHAD($P($ZPOS,"^",2),"NOMMAT")
 S GLO=$$CONCAS^%QZCHAD(GLO,X)
 
 S ND=WHOIS("NDCOUR")
 I Y="",$D(@GLO@(ND,"PREM")) S RES=@GLO@(ND,"PREM") Q RES
 I Y'="",$D(@GLO@(ND,"SUIV",Y)) S RES=@GLO@(ND,"SUIV",Y) Q RES
 
 S GLONDC=$$CONCAS^%QZCHAD(GLO,ND)
 S VU=$$CONCAS^%QZCHAD(GLONDC,"VU")
 S VOID=$$CONCAS^%QZCHAD(GLONDC,"VOID")
 
 S KEY2=Y
 I KEY2'="",$D(@VU@(KEY2)) S NDC=@VU@(KEY2) G BCLND
 S NDC=ND
BCLND S KEY2=$O(@ARB@(NDC,"MAT2",NOMMAT,X,KEY2))
 I KEY2="" G NDUP
 I KEY2=Y G BCLND
 I $D(@VU@(KEY2)) G BCLND
 I $D(@VOID@(KEY2)) G BCLND
 I @ARB@(NDC,"MAT2",NOMMAT,X,KEY2)=$C(0) S @VOID@(KEY2)="" G BCLND
 I Y="" S @GLONDC@("PREM")=KEY2
 I Y'="" S @GLONDC@("SUIV",Y)=KEY2
 S @VU@(KEY2)=NDC
 Q KEY2
 
 
NDUP 
 S %PERE=$$PERE^%QARBCON(ARBETU,NDC) I (%PERE="")!(%PERE=NDC) G FIN
 S NDC=%PERE
 I '($D(@GLO@(NDC,"FINI"))) S KEY2="" G BCLND
 I Y'="" G T2
 S L=@GLO@(NDC,"PREM") F %L=0:0 Q:L=""  Q:('($D(@VOID@(L))))&('($D(@VU@(L))))  S L=@GLO@(NDC,"SUIV",L)
 S @GLO@(ND,"PREM")=L
 G BCLCOP
T2 S L=@GLO@(NDC,"PREM") F %L=0:0 Q:L=""  Q:('($D(@VOID@(L))))&('($D(@VU@(L))))  S L=@GLO@(NDC,"SUIV",L)
 S @GLO@(ND,"SUIV",Y)=L
BCLCOP G:L="" FF
 S L2=L
 S L2=@GLO@(NDC,"SUIV",L2) F %L=0:0 Q:L2=""  Q:('($D(@VOID@(L2))))&('($D(@VU@(L2))))  S L2=@GLO@(NDC,"SUIV",L2)
 S @GLO@(ND,"SUIV",L)=L2,L=L2
 G BCLCOP
FF S @GLO@(ND,"FINI")=1
 S RES=$S(Y="":@GLO@(ND,"PREM"),1:@GLO@(ND,"SUIV",Y))
 Q RES
 
FIN I Y="" S @GLO@(ND,"PREM")=""
 I Y'="" S @GLO@(ND,"SUIV",Y)=""
 S @GLO@(ND,"FINI")=1
 Q ""

