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

;%TXBM^INT^1^59547,74031^0
%TXBM ;;03:00 PM  11 Oct 1993; ; 26 Mar 93  4:18 PM
 
INITGG 
 S @GG@("ARTICLE","FOREGROUND")=15
 S @GG@("ARTICLE","BACKGROUND")=1
 S @GG@("ARTICLE","NBCHAMPS")=2
 S @GG@("ARTICLE","NBLIGNES")=8
 S @GG@("ARTICLE",1,"LIBELLE")="nom"
 S @GG@("ARTICLE",2,"LIBELLE")="designation"
 S @GG@("FOURNISSEUR","FOREGROUND")=15
 S @GG@("FOURNISSEUR","BACKGROUND")=4
 S @GG@("FOURNISSEUR","NBCHAMPS")=1
 S @GG@("FOURNISSEUR","NBLIGNES")=6
 S @GG@("FOURNISSEUR",1,"LIBELLE")="nom"
 S @GG@("CONTRAT","FOREGROUND")=15
 S @GG@("CONTRAT","BACKGROUND")=5
 S @GG@("CONTRAT","NBCHAMPS")=3
 S @GG@("CONTRAT","NBLIGNES")=10
 S @GG@("CONTRAT",1,"LIBELLE")="nom"
 S @GG@("CONTRAT",2,"LIBELLE")="article"
 S @GG@("CONTRAT",3,"LIBELLE")="fournisseur"
 S @GG@("COMMANDE","FOREGROUND")=15
 S @GG@("COMMANDE","BACKGROUND")=7
 S @GG@("COMMANDE","NBCHAMPS")=4
 S @GG@("COMMANDE","NBLIGNES")=9
 S @GG@("COMMANDE",1,"LIBELLE")="nom"
 S @GG@("COMMANDE",2,"LIBELLE")="article"
 S @GG@("COMMANDE",3,"LIBELLE")="fournisseur"
 S @GG@("COMMANDE",4,"LIBELLE")="contrat"
 S @GG@("LIVRAISON","FOREGROUND")=15
 S @GG@("LIVRAISON","BACKGROUND")=2
 S @GG@("LIVRAISON","NBCHAMPS")=5
 S @GG@("LIVRAISON","NBLIGNES")=10
 S @GG@("LIVRAISON",1,"LIBELLE")="nom"
 S @GG@("LIVRAISON",2,"LIBELLE")="commande"
 S @GG@("LIVRAISON",3,"LIBELLE")="article"
 S @GG@("LIVRAISON",4,"LIBELLE")="contrat"
 S @GG@("LIVRAISON",5,"LIBELLE")="fournisseur"
 Q
 
INITMSQ 
 N I,J,OBLIG,TJSOK,PLL,NBC,NBKEY
 
 
 S NBKEY=@GG@(OBJET,"NBCHAMPS")
 S NBC=(NBKEY*2)-1
 S @GLO@("FL")="D"
 S @GLO=TITRE
 S @GLO@("H")=2,@GLO@("V")=2
 S @GLO@("NBC")=NBC
 F I=1:1:NBKEY S @GLO@("CHAMPS",(2*I)-1)=@GG@(OBJET,I,"LIBELLE"),@GLO@("CHAMPS",2*I)=" "
 K @GLO@("CHAMPS",I*2)
 S PLL=0 F I=1:1:NBC I $L(@GLO@("CHAMPS",I))>PLL S PLL=$L(@GLO@("CHAMPS",I))
 S @GLO@("PLL")=PLL
 S @GLO@("L")=50-PLL F I=1:1:NBC S @GLO@("LARG",I)=50-PLL
 F I=1:1:NBKEY S @GLO@("SUIV",(2*I)-1)=(2*I)+1,@GLO@("PREC",(2*I)+1)=(2*I)-1
 S @GLO@("SUIV",(2*I)-1)=1,@GLO@("PREC",1)=(2*I)-1
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

