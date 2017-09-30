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

;%QCALIST^INT^1^59547,73875^0
QCALIST ;
 
 
 
 
 
 
 
 
 
 
INTER(A,B,C,CARD) 
 N I,Y,X
 S X=$O(@A@("")),Y=$O(@B@("")),CARD=0
 F I=1:0 Q:(X="")!(Y="")  D INTER1
 Q
INTER1 I X=Y S @C@(X)="",CARD=CARD+1,X=$O(@A@(X)),Y=$O(@B@(Y)) Q
 I X]Y S Y=$S($D(@B@(X)):X,1:$O(@B@(X))) Q
 I Y]X S X=$S($D(@A@(Y)):Y,1:$O(@A@(Y))) Q
 Q
 
 
 
 
 
 
 
UNION(A,B,C,CARD) 
 N I,Y,X
 S I=0
 D RECOP(A,C,.I),RECOP(B,C,.I)
 S CARD=$$CARD(C)
 Q
 
 
 
 
 
 
 
RECOP(A,B,J) 
 N O,I
 S O=$O(@A@("")) I '($D(J)) S J=0
 F I=0:0 Q:O=""  S:'($D(@B@(O))) @B@(O)=@A@(O),J=J+1 S O=$O(@A@(O))
 Q
 
RECOP1(A,B,J) 
 N O,I
 S O=$O(@A@("")) I '($D(J)) S J=0
 F I=0:0 Q:O=""  S:'($D(@B@(O))) @B@(O)="",J=J+1 S O=$O(@A@(O))
 Q
 
 
CARD(LISTE) 
 N I,IND
 S IND=$O(@LISTE@(""))
 F I=0:1 Q:IND=""  S IND=$O(@LISTE@(IND))
 Q I
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
ISPART(LLISTE,LISTE,LOC,MORE,ABS,MODE) 
 N I,L,O,ADRL,TEMP,VIDE
 S TEMP=$$TEMP^%QZCHAD($P($ZPOS,"^",2),"ISPARTO") K @(TEMP)
 S VIDE=1
 S L=$O(@LLISTE@(""))
 F I=0:0 Q:L=""  Q:VIDE=0  D ISP1 S L=$O(@LLISTE@(L))
 K @(TEMP)
 Q VIDE
ISP1 S ADRL=@LLISTE@(L)
 S O=$O(@ADRL@(""))
 F I=0:0 Q:O=""  Q:(VIDE=0)&(MODE=0)  D ISP2 S O=$O(@ADRL@(O))
 Q
ISP2 
 I LISTE'="",'($D(@LISTE@(O))) S VIDE=0 Q:'(MODE)  S @ABS@(O)=""
 I $D(@LOC@(O)) S VIDE=0 Q:'(MODE)  S @MORE@(O)=""
 I '(MODE) S @LOC@(O)=L Q
 S @LOC@(O,L)=""
 Q

