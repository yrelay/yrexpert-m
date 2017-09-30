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

;%QSMOSYS^INT^1^59547,73882^0
%QSMOSYS ;PS;08:45 PM  2 Jan 1996
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
INIT(M,GL1,GLAUT,REPCR) 
 
 
 N IREP,PDLIG,NOMEXT,NOMINT,TYPREP,AUTOR,CONDIT,PROF,PARPDLIG
 S @REPCR=0
 F IREP=1:1 S PDLIG=$P($T(BIBSY+IREP),";;",2) Q:PDLIG=""  D CONSUL
 Q
CONSUL S @("NOMEXT="_$P(PDLIG,"/",2))
 Q:$D(@GL1@(M,NOMEXT))
 S CONDIT=$P(PDLIG,"/",6) I CONDIT'="" Q:'($$OKR^%INCOIN(CONDIT))
 S @("NOMINT="_$P(PDLIG,"/",3))
 S @("TYPREP="_$P(PDLIG,"/",4))
 S @("AUTOR="_$P(PDLIG,"/",5))
 S PARPDLIG=$P(PDLIG,"/",7)
 S @("PROF=PARPDLIG")
 ; S @("PROF="_$P(PDLIG,""/"",7))
 S:PROF="" PROF=1
 S @REPCR=@REPCR+1,@REPCR@(@REPCR)=NOMEXT
 S @REPCR@(@REPCR,"NOMINT")=NOMINT
 S @REPCR@(@REPCR,"NBCLEF")=PROF
 S @GL1@(M,NOMEXT)=NOMINT_"^"_PROF_"^"_TYPREP_"^1"
 I AUTOR S @GLAUT@(M,NOMEXT)=""
 Q
 
 
 
 
 
 
 
 
 
 
 
LIENS(M,GLH,GLR,GLI) 
 S @GLI@(M,"TRAITEMENT","APPELLE")="APPELE.PAR^N^N"
 S @GLI@(M,"ETAT.RESEAU","ETAT.PRECEDE")="ETAT.SUIT^O^N"
 S @GLH@(M,"RESEAU","ETAT.RESEAU")="ETAT.RESEAU^RESEAU^N^N"
 Q
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
VERIF(M,NOMEXT,NOMINT,TREP) 
 N IRP,PDLIG,EXTA,INTA,TYPA,REPSYS,INCSYS,TXTER,EGALX,EGALI,EGALT
 S REPSYS=0,INCSYS=0
 F IRP=1:1 S PDLIG=$P($T(BIBSY+IRP),";;",2) Q:PDLIG=""  D VERIF2
 Q:INCSYS -1
 Q REPSYS
VERIF2 S @("EXTA="_$P(PDLIG,"/",2))
 S @("INTA="_$P(PDLIG,"/",3))
 S @("TYPA="_$P(PDLIG,"/",4))
 S EGALX=NOMEXT=EXTA,EGALI=$$INTEGAL(NOMINT,INTA),EGALT=TREP=TYPA
 I (EGALX&EGALI)&EGALT S REPSYS=1 Q
 Q:(('(EGALX))&('(EGALI)))&('(EGALT))
 G:EGALI!('(EGALX)) VERIF21
 S TXTER=$$^%QZCHW("Le repertoire ")_NOMEXT_$$^%QZCHW(" doit avoir ")_INTA_$$^%QZCHW(" comme nom interne ")
 S TXTER=TXTER_". "_$$^%QZCHW("Veuillez recopier le repertoire de nom interne")_" "_NOMINT_" "_$$^%QZCHW("dans le repertoire de nom interne")_" "_INTA_", "_$$^%QZCHW("si celui-ci existe")_", "_$$^%QZCHW("puis modifier le schema. ")
 D WRITER^%QSVERER("<SYNTAX>",TXTER)
VERIF21 G:EGALT!('(EGALX)) VERIF22
 S TXTER=$$^%QZCHW("Le repertoire ")_NOMEXT_$$^%QZCHW(" doit etre de type ")_TYPA
 
 D WRITER^%QSVERER("<SYNTAX>",TXTER)
VERIF22 I EGALI&('(EGALX)) S TXTER=NOMINT_$$^%QZCHW(" : nom interne reserve au repertoire ")_EXTA D WRITER^%QSVERER("<SYNTAX>",TXTER)
 I EGALI&('(EGALT)) S TXTER=$$^%QZCHW("Le repertoire de nom interne ")_NOMINT_$$^%QZCHW(" doit etre de type ")_TYPA D WRITER^%QSVERER("<SYNTAX>",TXTER)
 I EGALT&('(EGALX)) S TXTER=$$^%QZCHW("Seul le repertoire ")_EXTA_$$^%QZCHW(" peut etre de type ")_TREP D WRITER^%QSVERER("<SYNTAX>",TXTER)
 I EGALT&('(EGALI)) S TXTER=$$^%QZCHW("Seul le repertoire de nom interne ")_INTA_$$^%QZCHW(" peut etre de type ")_TREP D WRITER^%QSVERER("<SYNTAX>",TXTER)
 S INCSYS=1
 Q
 
 
INTEGAL(NOMINT,INTA) 
 Q:NOMINT=INTA 1
 Q:INTA'=(M_".L.I") 0
 Q:((NOMINT="LIEN.I")!(NOMINT=(M_".LIEN.I")))!(NOMINT="L.I") 1
 Q 0
 
 
 
 
BIBSY 
 ;;/"REQUETE"/"RQS"/"REQUETE"/1/
 ;;/"LISTE"/"L0"/"LISTE"/1/
 ;;/"ETUDE"/"ETUDE.I"/"ETUDE"/1/
 ;;/"ETUDE.TOTEM"/"ETUDE.TOTEM"/"ETUDE.TOTEM"/1/"TO"/
 ;;/"SAISIE"/"SAISIE.I"/"SAISIE"/1/
 ;;/"NOEUD.LOGIQUE"/"NOEUD.I"/"NOEUD.LOGIQUE"/1/"QMEC"/
 ;;/"ATTRIBUT"/"ATTRIBUT"/"ATTRIBUT"/1/
 ;;/"TRAITEMENT"/"TRAITEMENT"/"TRAITEMENT"/1/
 ;;/"LIEN"/M_".L.I"/"LIEN"/0
 ;;/"RESEAU"/"RESEAU"/"RESEAU"/1//1/
 ;;/"ETAT.RESEAU"/"ETAT.RESEAU"/"ETAT.RESEAU"/1//2/
 ;;/"%"/"%"/"%"/0/
 ;;

