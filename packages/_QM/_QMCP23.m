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

;%QMCP23^INT^1^59547,73876^0
QMCP23 ;
 
QUF(QUI1,BASE1,IND1,LIEN1,BASE1L,IND1L,QUI2,BASE2,IND2,LIEN2,BASE2L,IND2L,MODE) 
 N LIEN1I,LIEN2I
 D QUF1(QUI1,BASE1,IND1,LIEN1,IND1L,QUI2,BASE2,IND2,LIEN2,IND2L,MODE)
 S LIEN1I=$$LIENI^%QMCP2(QUI1,LIEN1)
 S LIEN2I=$$LIENI^%QMCP2(QUI2,LIEN2)
 D QUF1(QUI1,BASE1L,IND1L,LIEN1I,IND1,QUI2,BASE2L,IND2L,LIEN2I,IND2,MODE)
 Q
QUF1(QUI1,BASE1,IND1,LIEN1,IND1L,QUI2,BASE2,IND2,LIEN2,IND2L,MODE) 
 N L1,L2,LIEN1I,LIEN2I
 
 I ('($$QUAL^%QMCPZ(WHOIS1,QUI1,BASE1,LIEN1)))!('($$QUAL^%QMCPZ(WHOIS2,QUI2,BASE2,LIEN2))) Q
 S L1=$$REFLIEN^%QMCPZ(WHOIS1,QUI1,IND1,LIEN1,IND1L)
 
 Q:L1=""
 S L2=$$REFLIEN^%QMCPZ(WHOIS2,QUI2,IND2,LIEN2,IND2L)
 
 I MODE=3 D LILIEN^%QMCPOZ(QUI,WHOIS2,QUI2,IND2,LIEN2,IND2L,L2)
 D COPL(QUI1,L1,QUI2,L2,MODE)
 Q
COPL(QUI1,L1,QUI2,L2,MODE) 
 N LATT,TEMP,LATT,ATT,I,BASE1,BASE2
 S TEMP=$$TEMP^%QZCHAD($P($ZPOS,"^",2),"COPL")
 S LATT=$$CONCAS^%QZCHAD(TEMP,"LATT")
 K @(TEMP)
 
 S BASE1=$$ONE^%QMCPZ(WHOIS1,QUI1)
 S BASE2=$$ONE^%QMCPZ(WHOIS2,QUI2)
 D LIA^%QMCPZ(WHOIS1,QUI1,L1,LATT)
 S ATT=$O(@LATT@(""))
 F I=0:0 Q:ATT=""  D TO1^%QMCP21(WHOIS1,QUI1,BASE1,L1,ATT,WHOIS2,QUI2,BASE2,L2,MODE) S ATT=$O(@LATT@(ATT))
 K @(TEMP)
 Q

