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

;%ATPETUD^INT^1^59547,73866^0
%ATPETUD ;;06:16 PM  3 Dec 1992; ; 03 Dec 92  6:39 PM
 
 
 
 
 
 
 
 
 
DEFETU(GLODEFA,GLOCARAF) 
 S @GLOCARAF@("TITRE")="Description de l'Etude"
 
 S @GLOCARAF@("NBC")=3
 S @GLOCARAF@("NBFIXH")=1,@GLOCARAF@("NBFIXB")=1
 S @GLOCARAF@("GLOB")="^[QUI]RQSDON(""ETUATN"",ETUDE)"
 
 S @GLODEFA@("FIXH",1,"LIB")="Etude"
 S @GLODEFA@("FIXH",1,"ROUCAL")="$$etude^%ATPETUD"
 S @GLODEFA@("FIXB",1,"LIB")="Etat de l'etude"
 S @GLODEFA@("FIXB",1,"ROUCAL")="$$etetu^%ATPETUD"
 
 S @GLODEFA@("ROULIB")="$$libetu^%ATPETUD"
 S @GLODEFA@("ROUDEF")="$$vdefetu^%ATPETUD"
 S @GLODEFA@("ROUAFF")="$$libetu^%ATPETUD"
 Q
 
ACTI 
 
 S GLODEFA=$$TEMP^%SGUTIL
 S GLOCARAF=$$TEMP^%SGUTIL
 D DEFETU^%ATPETUD(GLODEFA,GLOCARAF)
 D SAISVAL^%TXPSUT2(@GLOCARAF@("GLOB"),GLODEFA,@GLOCARAF@("TITRE"),@GLOCARAF@("NBC"),@GLOCARAF@("NBFIXH"),@GLOCARAF@("NBFIXB"),1)
 K @(GLODEFA)
 Q
 
libetu(i) 
 Q:i=1 "Commentaire"
vdefetu(i) 
 Q:i=1 "Mise au Point"
 
 
etetu() Q "Non encore activee"
 
valetu() Q 3000000000E-0
 
etude() Q ETUDE
 
 
 
INIETU(GETU) 
 N V1,V2
 F I=1:1:9 S V1=$$libetu(I) I '($D(@GETU@(V1))) S @GETU@(V1)=$$vdefetu(I)
 S:'($D(@GETU@("Etat de l'etude"))) @GETU@("Etat de l'etude")=$$etetu
 S:'($D(@GETU@("Valeur"))) @GETU@("Valeur")=$$valetu
 Q
 ;
 ;

