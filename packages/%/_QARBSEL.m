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

;%QARBSEL^INT^1^59547,73875^0
ARBSELE(ARB) 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 N EXT,INDI,LISTE,MAT,MIN,NOEUD,RES,VAL
 D MSG^%VZEATT($$^%QZCHW("Selection du prochain noeud"))
 S LISTE=$$TEMP^%QZCHAD($P($ZPOS,"^",2),"LIS") K @(LISTE)
 
 S EXT="",MIN=10E10
BEXT S EXT=$O(@ARB@("EXT",EXT)) I EXT="" G FEXT
 I @ARB@("EXT",EXT)="CIRCUIT" G BEXT
 S VAL=$$VAL^%QARBCON(ARB,EXT)
 I VAL<MIN S MIN=VAL K @(LISTE)
 
 I VAL=MIN S @LISTE@(EXT)=""
 G BEXT
FEXT 
 S NOEUD="",EXT=""
CHEX 
 S EXT=$O(@LISTE@(EXT)) G:EXT="" CHNO
 S INDI=$ZP(@ARB@("SOLUTION",""))+1
 S VAL=$$CIRCUIT(ARB,EXT,$$CONCAS^%QZCHAD(ARB,"SOLUTION,"_INDI))
 I VAL=0 G CHEX
 
 
 D MSG^%VZEATT($$^%QZCHW("CIRCUIT TROUVE DE VALEUR")_"  =  "_VAL)
 
 S @ARB@("SOLUTION",INDI)=VAL
 S @ARB@("EXT",EXT)="CIRCUIT"
 S NOEUD="" G FIN
 
CHNO 
 S NOEUD=$O(@LISTE@(""))
 I NOEUD="" G FIN
 
 I @ARB@("TYPE",NOEUD)="AUTORISE" G FIN
 
 I $O(@LISTE@(NOEUD))="" G INTER
 K @LISTE@(NOEUD)
 G CHNO
FIN 
 K @(LISTE) Q NOEUD
 
INTER 
 
 
 N ORI,DES,NOM,NMAT
 D COPM^%QARBEVA(GLAM,@ARB@("MAT",NOEUD,"ANCIENNE"),.NMAT)
 S @ARB@("MAT",NOEUD,"NOUVELLE")=NMAT
 S NOM=@ARB@("NOM",NOEUD)
 S RES=$P(NOM,"NON ",2)
 S ORI=$P(RES,"^",1),DES=$P(RES,"^",2)
 S @GLAM@(NMAT,"LIG",ORI,DES)=10E10,@GLAM@(NMAT,"COL",DES,ORI)=10E10
 
 S RES=$$RETR^%QARBEVA(GLAM,NMAT,"LIG",ORI)
 S RES=$$RETR^%QARBEVA(GLAM,NMAT,"COL",DES)
 
 D MAJ0^%QARBEVA(GLAM,NMAT)
 G FIN
 
CIRCUIT(ARB,EXT,RES) 
 
 N CIRC,DEP,ORI,PARC,L
 S PARC=$$TEMP^%QZCHAD($P($ZPOS,"^",2),"PARC") K @(PARC)
 D PARC(ARB,EXT,PARC)
 S DEP=@ARB@("ORI"),ORI=DEP
 
 S @RES@(1)=ORI
CIRC I '($D(@PARC@(ORI))) S CIRC=0 G FCIRC
 S ORI=@PARC@(ORI)
 I ORI'=DEP S @RES@($ZP(@RES@(""))+1)=ORI G CIRC
 
 S @RES@($ZP(@RES@(""))+1)=DEP
 
 S L=$$VAL^%QARBCON(ARB,EXT)
 
 S CIRC=$$ALL(ARB,PARC)
FCIRC K @(PARC)
 I CIRC=0 K @(RES) Q 0
 
 Q L
 
ALL(ARB,PARC) 
 N %N,CIRC,MAT,N
 S MAT=@ARB@("MAT",@ARB@("ORI"),"ANCIENNE")
 
 S N="",CIRC=1
 F %N=0:0 S N=$O(@GLAM@(MAT,"COL",N)) Q:N=""  I '($D(@PARC@(N))) S CIRC=0 Q
 Q CIRC
 
PARC(ARB,EXT,LIST) 
 
 N PERE,NOM
 S PERE=$$PERE^%QARBCON(ARB,EXT)
 I PERE="" Q
 S NOM=@ARB@("NOM",EXT)
 I @ARB@("TYPE",EXT)="AUTORISE" S @LIST@($P(NOM,"^",1))=$P(NOM,"^",2)
 D PARC(ARB,PERE,LIST)
 Q
 
 
TEST 
 G TEST^%QARBEVA

