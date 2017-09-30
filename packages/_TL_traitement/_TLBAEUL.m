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

;%TLBAEUL^INT^1^59547,74028^0
TLBAEUL ;
 
 N T,I,K1,M
 K @PILE@(NIVK)
 
 I NIVK'=1 G PPNIV
 S @Z1@(1)=@ENDPT@(2,1)
 S @PILE@(NIVK,1)=1
 S @PILE@(NIVK)=1
 Q
PPNIV 
 I NIVK'=2 S @Z1@(NIVK-1)=(@ENDPT@(1,@GLOS@(NIVK-1))+@ENDPT@(2,@GLOS@(NIVK-1)))-@Z1@(NIVK-2)
 S T=@Z1@(NIVK-1)
 I OPTION=2 G ORIENT
 F I=1:1:LONG S @ED@(I)=(T=@ENDPT@(1,I))!(T=@ENDPT@(2,I))
 G PCOM
ORIENT 
 F I=1:1:LONG S @ED@(I)=T=@ENDPT@(1,I)
PCOM 
 S K1=NIVK-1
 F I=1:1:K1 S @ED@(@GLOS@(I))=0
 S M=0
 F I=1:1:LONG I @ED@(I) S M=M+1,@PILE@(NIVK,M)=I
 S @PILE@(NIVK)=M
 Q
 
INIT 
 S ENDPT=$$CONCAS^%QZCHAD(RACINE,"ENDPT")
 S ED=$$CONCAS^%QZCHAD(RACINE,"ED")
 S Z1=$$CONCAS^%QZCHAD(RACINE,"Z1")
 D CLEPAG^%VVIDEO
 S OPTION=1+$$MES^%VZEOUI("graphe oriente","O")
 
 W !,!
 S LONG=$$^%VZAME1("nombre d'aretes")
 
 W !,!
 I '($$MES^%VZEOUI("initialisation","O")) Q
 
 F I=1:1:LONG D ARET
 Q
ARET 
 W !,!
 S @ENDPT@(1,I)=$$^%VZAME1("ENDPT(1,"_I_")=")
 W !
 S @ENDPT@(2,I)=$$^%VZAME1("ENDPT(2,"_I_")=")
 Q

