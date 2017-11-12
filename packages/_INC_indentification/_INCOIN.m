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
;! Nomprog     : %INCOIN                                                      !
;! Module      :                                                           !
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
;! HL002 ! HL     ! 11/11/17 ! si WHOIS n'existe pas                          !
;!-------!--------!----------!------------------------------------------------!
;!============================================================================!

%INCOIN ;
 
CNX(PREF) 
 I $D(^INCONNE("CNY",WHOIS)) Q:($D(^INCONNE("CNY",WHOIS,"LK",PREF,"R"))#10)=1 ^INCONNE("CNY",WHOIS,"LK",PREF,"R") Q 0
 I ($D(^INCONNE("DEFAUT","WHOIS"))#10)=0 Q 0
 N WHDEF
 S WHDEF=^INCONNE("DEFAUT","WHOIS")
 Q:($D(^INCONNE("CNY",WHDEF,"LK",PREF,"R"))#10)=1 ^INCONNE("CNY",WHDEF,"LK",PREF,"R")
 Q 0
OKR(PREF)
 S:'$D(WHOIS) WHOIS=^TABIDENT("DMO","WHOIS")="DMO" ;HL002
 I $D(^INCONNE("CNY",WHOIS)) Q:($D(^INCONNE("CNY",WHOIS,"LK",PREF,"U"))#10)=1 ^INCONNE("CNY",WHOIS,"LK",PREF,"U") Q 0
 I ($D(^INCONNE("DEFAUT","WHOIS"))#10)=0 Q 0
 N WHDEF
 S WHDEF=^INCONNE("DEFAUT","WHOIS")
 Q:($D(^INCONNE("CNY",WHDEF,"LK",PREF,"U"))#10)=1 ^INCONNE("CNY",WHDEF,"LK",PREF,"U")
 Q 0
 
CNXI(WHOIS,PREF) 
 Q $$^%QCAZG("^INCONNE(""CNY"",WHOIS,""LK"",PREF,""R"")")+0
OKRI(WHOIS,PREF) 
 Q $$^%QCAZG("^INCONNE(""CNY"",WHOIS,""LK"",PREF,""U"")")+0
TABID(PAR) 

 
 Q:PAR="" ""
 I $D(^TABIDENT(WHOIS)) Q $$TABIDI(WHOIS,PAR)
 N WHDEF
 S WHDEF=$$^%QCAZG("^INCONNE(""DEFAUT"",""WHOIS"")")
 Q:WHDEF="" ""
 Q $$TABIDI(WHDEF,PAR)
TABIDI(WHOIS,PAR) 
 Q:PAR="" ""
 N R
 S R=$$^%QCAZG("^TABIDENT(WHOIS,PAR)")
 I R'="" Q R
 I PAR="ORDINATEUR" Q "VAX"
 I PAR="LANGAGE" Q "M11"
 Q ""
 
 
TEMP(STO,ZN) 
 N UC
 S UC=$$TABID("ORDINATEUR")
 I (UC="VAX")!(UC="IBM-PC") Q STO
 Q $$CONCAS^%QZCHAD("^TEMPORAI",$J_","_ZN)

