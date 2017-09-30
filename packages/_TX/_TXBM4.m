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

;%TXBM4^INT^1^59547,74031^0
%TXBM4 ;;09:57 AM  5 Oct 1993; ; 26 Mar 93  4:18 PM
 
 
 
 
INITMSQ 
 N I,J,OBLIG,TJSOK,PLL,NBC,NBKEY
 
 
 S NBKEY=4
 S NBC=4
 S @GLO@("FL")="D"
 S @GLO=TITRE
 S @GLO@("H")=2,@GLO@("V")=2
 S @GLO@("NBC")=NBC
 S @GLO@("CHAMPS",1)="numero de commande"
 S @GLO@("CHAMPS",2)="article"
 S @GLO@("CHAMPS",3)="numero de contrat"
 S @GLO@("CHAMPS",4)="fournisseur"
 S PLL=0 F I=1:1:NBC I $L(@GLO@("CHAMPS",I))>PLL S PLL=$L(@GLO@("CHAMPS",I))
 S @GLO@("PLL")=PLL
 S @GLO@("L")=30-PLL F I=1:1:NBC S @GLO@("LARG",I)=30-PLL
 F I=1:1:NBC S J=I+1 S:J>NBC J=1 S @GLO@("SUIV",I)=J,@GLO@("PREC",J)=I
 S @GLO@("POP1")="",@GLO@("POP2")=""
 
 
 
 S TJSOK="S OK=1"
 S @GLO@("STO.DER")=1
 S @GLO@("BOU.AJOUT")=0,@GLO@("BOU.ERREUR")=1
 S @GLO@("EXEC.UCONT")="C"
 F I=1:1:NBC S @GLO@("UCONT.CHAMPS",I)=""
 S @GLO@("UCONT")=""
 
 F I=1:1:NBC S @GLO@("OBLIGAT",I)=TJSOK
 F I=1:1:NBC S @GLO@("FORMAT",I)=TJSOK
 F I=1:1:NBC S @GLO@("VALEG",I,0)=TJSOK
 Q
 ;
 ;

