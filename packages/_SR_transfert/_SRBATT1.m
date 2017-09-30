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

;%SRBATT1^INT^1^59547,73891^0
%SRBATT1 ;;09:42 AM  24 Mar 1993; 08 Jan 93  4:47 PM ; 24 Mar 93  9:46 AM
 
 
 
 
 
 
 
 
 
 
 
 
 
SAISIE(REP,IND,ATT,VALDEF,TITRE,IDEB,IFIN,REPCODE,INDCODE,ATTCODE) 
 N GLOB,GLODEFA,NBC,NBFIXH,NBFIXB
 S GLOB=$$TEMP^%SGUTIL
 S J=0
 F I=IDEB:1:IFIN S J=J+1,V=$$^%QSCALIN(REP,IND,ATT,I),@GLOB@(J)=$S(V="":VALDEF,1:V)
 S PMAX=J
 S @GLOB@("Valeur Standard")=VALDEF
 S GLODEFA=$$TEMP^%SGUTIL
 
 S NBC=10,NBFIXH=0,NBFIXB=0
 
 S @GLODEFA@("ROULIB")="$$vstoctr^%SRBATT1"
 S @GLODEFA@("ROUAFF")=$S(REPCODE="":"$$vaffctr^%SRBATT1",1:"$$vaffcode^%SRBATT1")
 S @GLODEFA@("ROUDEF")="$$vdef^%SRBATT1"
 D SAISVAL^%TXPSUT2(GLOB,GLODEFA,TITRE,NBC,NBFIXH,NBFIXB,PMAX)
 F J=1:1:PMAX D PA^%QSGESTI(REP,IND,ATT,@GLOB@(J),(IDEB+J)-1)
 Q
 
 
vdef(i) B
 Q i
vstoctr(i) Q i
vaffctr(i) Q "Periode "_i
vaffcode(i) N V
 S V=$$^%QSCALIN(REPCODE,INDCODE,ATTCODE,(i+IDEB)-1) Q V
 D:'($D(^[QUI]RQSDON("REMATDAT",REPCODE,ATTCODE))) SETREM^%QMDAUC(REPCODE,ATTCODE)
 Q:'(^[QUI]RQSDON("REMATDAT",REPCODE,ATTCODE)) V
 Q $$AFFI^%QMDAUC(REPCODE,ATTCODE,V)
 ;

