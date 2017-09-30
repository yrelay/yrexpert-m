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

;%QSVERI1^INT^1^59547,73883^0
QSVERI1 ;
VERIF1 
 
 
 
 N II,NL,I,NIDOUBLE,IND,NLP,J,DOUBLE,LOG,L,K
 S %VAR="",%LIGNE=1
 F I=1:1:COMPT S NIDOUBLE(I)=""
 S NL="" F I=1:1 W "." S NL=$O(@TEMPO@(M,"NOM INTERNE",NL)) Q:NL=""  S IND(I)=0,NLP=NL F J=I+1:1 S NLP=$O(@TEMPO@(M,"NOM INTERNE",NLP)) D:NLP="" VER12 Q:NLP=""  D VER11
 Q
 
VER11 I @TEMPO@(M,"NOM INTERNE",NL)=@TEMPO@(M,"NOM INTERNE",NLP) S IND(I)=IND(I)+1,NIDOUBLE(I)=@TEMPO@(M,"NOM INTERNE",NL) S:IND(I)=1 DOUBLE(I,IND(I))=NL S DOUBLE(I,IND(I)+1)=NLP
 Q
VER12 Q:IND(I)=0
 S LOG=0 F L=1:1:I-1 D:NIDOUBLE(I)=NIDOUBLE(L) VER121
 Q:LOG=1
 S SYNTAX=1
 F K=1:1:IND(I)+1 S %VAR=%VAR_" "_DOUBLE(I,K)
 S %VAR=%VAR_$$^%QZCHW(" ont le meme nom interne : ")_NIDOUBLE(I),ERREUR="<SYNTAX>"
WRITE S:($L(%VAR)\50)'<1 %LIGNE=($L(%VAR)\50)+1
 S:$L(%VAR)=50 %LIGNE=1
 F II=1:1:%LIGNE S %ERR=%ERR+1,@COL@(%ERR,"LI")=$E(%VAR,((II-1)*50)+1,((II-1)*50)+50) S:II=1 @COL@(%ERR)=ERREUR S:II>1 @COL@(%ERR)=" "
 S %VAR="",%LIGNE=1
 Q
VER121 S LOG=1
 Q

