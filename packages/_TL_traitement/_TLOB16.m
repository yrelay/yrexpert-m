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

;%TLOB16^INT^1^59547,74030^0
%TLOB16 ;;11:55 AM  19 Oct 1992; ; 19 Oct 92  2:29 PM
 
 
 
 
 
 
 
 
TRTMAP(TRT,BA,IND) 
 N OLISTE,TEMPO,LISTE,PREF,LISTE,MODEX,MODAF,NIVEAU,GLOETD
 D INIT^%ANGEPIL
 S TEMPO=$$TEMP^%SGUTIL
 K @(TEMPO) S @TEMPO@(1)="EXTRT",@TEMPO@(2)="OLISTE"
 S @TEMPO@(3)="BA",@TEMPO@(4)="T",@TEMPO@(5)="OBJ",@TEMPO@(6)="POS"
 S @TEMPO@(7)="SIND",@TEMPO@(8)="ETIQ",@TEMPO@(9)="PARTIE"
 S @TEMPO@(10)="I",@TEMPO@(11)="REP",@TEMPO@(12)="IND"
 S @TEMPO@(13)="ECHGL"
 S PREF="TRT"
 S LISTE=$$GEN^%QCAPOP(PREF),ADRESSE="^[QUI]ZLIGTRAI("""_LISTE_""")"
 D CREERL^%QS0XG1(LISTE,BA,ADRESSE,"TRAITEMENT","AUTOMATIQUE")
 D AJOUT^%QS0XG1(LISTE,IND)
 S I=14,T=""
BCXT S T=$O(CXT(T)) I T="" G PILE
 S @TEMPO@(I)="CXT("""_T_""",""BASE"")",@TEMPO@(I+1)="CXT("""_T_""",""OBJET"")"
 S I=I+2
 G BCXT
 
PILE D EMPV^%ANGEPIL(TEMPO)
 
 S MODEX=1,MODAF=1,NIVEAU=0
 S CXT("%","BASE")="%"
 S CXT("%","OBJET")=$J
 S EXTRT=$$^%QCAZG("TRT"),OLISTE=$$^%QCAZG("LISTE")
 S SIND=0,ETIQ="",PARTIE=""
 S GLOETD=$$TEMP^%SGUTIL
 S (ABANDON,HALT,ECHGL)=0,TRAIT=TRT,ORIG="TRAIT"
 S @GLOETD@("NIVEAU")=0
 S @GLOETD@("ETUDE")=""
 S @GLOETD@("DEROULEMENT")="procedural"
 S @GLOETD@("TRAITEMENT")=TRT
 S @GLOETD@("LISTE")=LISTE
 S @GLOETD@("DATE")=$$DATE^%QMDATE_" "_$$HEURE^%QMDATE
 S @GLOETD@("HEURE.DEBUT")=$H,@GLOETD@("DUREE.EXECUTION")="0,0"
 S @GLOETD@("ATTRIBUT")=0
 D EMPIL^%ANGEPIL("RETOUR^%TLOB16")
 G ^%TLBADEB
 
RETOUR 
 I ECHGL>0 S ECHEC=1
MAJ 
 S TRT=EXTRT,LISTE=OLISTE
 I (ORIG'="TRAIT")!ABANDON G FTRAITER
 I MODAF=2 D REAF^%TLBAIF(1)
 I MODAF=1 D REAF^%TLBAIF(0)
 
FTRAITER 
 D ELIML^%QS0XG1(LISTE)
 Q
 ;

