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

;%TXPKCR1^INT^1^59547,74032^0
%TXPKCR1 ;;03:53 PM  2 Jul 1993; ; 02 Jul 93  4:33 PM
 
 
 
 
 
CONTATT 
 S CONTRAINTE="CAPACITE"
 S @etuatc@("Etude")=ETUDE
 S @etuatc@("Atelier")=ATELIER
 S @etuatc@("Contrainte")=CONTRAINTE
 S @etuatc@("Valeur globale")="000"
 
 S @etuatc@("Etat de cette contrainte")="Active"
 S @etuatc@("Commentaire")="contrainte de capacite"
 S @etuatc@("Unite de Calcul")="Nombre d'Heures"
 S @etuatc@("Valeur Standard")="100000"
 S:$$TYPATE^%TXPDKB(ATELIER)="FOURNISSEUR" @etuatc@("Valeur Standard")="10000000000"
 
 
 
 
 F i=1:1:NBPERIOD S val=$$^%QSCALIN(REPATE,ATELIER,"PRODUCTION.MAXI",(i+PREMPERI)-1),@etuatc@("Periode "_i)=$S(val="":@etuatc@("Valeur Standard"),1:val)
 Q
 
CTSTO S em="^[QUI]etu(ETUDE,""AT"",ATELIER,""AR"",ARTICLE,""stm"")"
 S eM="^[QUI]etu(ETUDE,""AT"",ATELIER,""AR"",ARTICLE,""stM"")"
 S vsm=@etuata@("Valeur Std de Stock Mini")
 S vsM=@etuata@("Valeur Std de Stock Maxi")
 S ATTm="STOCK.MINI",ATTM="STOCK.MAXI"
 F %ii=1:1:NBPERIOD D get
 Q
 
 
CTPRD S em="^[QUI]etu(ETUDE,""AT"",ATELIER,""AR"",ARTICLE,""qm"")"
 S eM="^[QUI]etu(ETUDE,""AT"",ATELIER,""AR"",ARTICLE,""qM"")"
 S vsm=0,vsM=10000000
 S ATTm="PRODUCTION.MINI",ATTM="PRODUCTION.MAXI"
 F %ii=1:1:NBPERIOD D get
 Q
 
get N val
 S val=$$^%QSCALIN(REPART,ARTICLE,ATTm,(%ii+PREMPERI)-1)
 S @em@(%ii)=$S(val="":vsm,1:val)
 S val=$$^%QSCALIN(REPART,ARTICLE,ATTM,(%ii+PREMPERI)-1)
 S @eM@(%ii)=$S(val="":vsM,1:val)
 Q
 ;
 ;

