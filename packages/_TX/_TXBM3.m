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

;%TXBM3^INT^1^59547,74031^0
%TXBM3 ;;04:13 PM  11 Oct 1993; ; 26 Mar 93  4:18 PM
 
 
 
 
INITMSQ 
 N I,J,OBLIG,TJSOK,PLL,NBC,NBKEY
 
 
 S NBKEY=3
 S NBC=5
 S @GLO@("FL")="D"
 S @GLO=TITRE
 S @GLO@("H")=2,@GLO@("V")=2
 S @GLO@("NBC")=NBC
 S @GLO@("CHAMPS",1)="numero de contrat"
 S @GLO@("CHAMPS",3)="article"
 S @GLO@("CHAMPS",5)="fournisseur"
 S @GLO@("CHAMPS",2)=" ",@GLO@("CHAMPS",4)=" "
 S PLL=0 F I=1:1:NBC I $L(@GLO@("CHAMPS",I))>PLL S PLL=$L(@GLO@("CHAMPS",I))
 S @GLO@("PLL")=PLL
 S @GLO@("L")=40-PLL F I=1:1:NBC S @GLO@("LARG",I)=40-PLL
 S @GLO@("SUIV",3)=5,@GLO@("SUIV",5)=3
 S @GLO@("PREC",5)=3,@GLO@("PREC",3)=5
 S @GLO@("POP1")="",@GLO@("POP2")=""
 
 
 
 S TJSOK="S OK=1"
 S @GLO@("STO.DER")=1
 S @GLO@("BOU.AJOUT")=0,@GLO@("BOU.ERREUR")=1
 S @GLO@("EXEC.UCONT")="C"
 F I=1:1:NBC S @GLO@("UCONT.CHAMPS",I)=""
 S @GLO@("UCONT")=""
 S OBLIG="S OK=(VAL'="""")"
 F I=1:1:NBC S @GLO@("OBLIGAT",I)=TJSOK
 
 F I=1:1:NBC S @GLO@("FORMAT",I)=TJSOK
 F I=1:1:NBC S @GLO@("VALEG",I,0)=TJSOK
 Q
 
 
AJOUT 
 N OBLIG,NBC,TJSOK
 S NBC=5
 S OBLIG="S OK=(VAL'="""")",TJSOK="S OK=1"
 K @GLO@("OBLIGAT")
 S (@GLO@("OBLIGAT",2),@GLO@("OBLIGAT",4))=TJSOK
 S (@GLO@("OBLIGAT",1),@GLO@("OBLIGAT",3),@GLO@("OBLIGAT",5))=OBLIG
 Q
 
CMS 
 N TJSOK S TJSOK="S OK=1"
 K @GLO@("OBLIGAT")
 S (@GLO@("OBLIGAT",2),@GLO@("OBLIGAT",4))=TJSOK
 S (@GLO@("OBLIGAT",1),@GLO@("OBLIGAT",3),@GLO@("OBLIGAT",5))=TJSOK
 Q
 
SUIVPREC 
 N BLOCK
 S BLOCK(2)="",BLOCK(4)=""
 I FIXED("ARTICLE") S BLOCK(3)=""
 I FIXED("FOURNISSEUR") S BLOCK(5)=""
 D SVP(5)
 Q
 
SVP(NBC) 
 N I,J,%X
 K @GLO@("SUIV"),@GLO@("PREC")
 F I=1:1:NBC I '($D(BLOCK(I))) S J=I F %X=1:1 S J=J+1 S:J>NBC J=1 Q:%X>NBC  I '($D(BLOCK(J))) S @GLO@("SUIV",I)=J,@GLO@("PREC",J)=I Q

