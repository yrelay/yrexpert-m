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

;%QMEXCAR^INT^1^59547,73878^0
%QMEXCAR ;;05:04 PM  22 Nov 1993; ; 22 Nov 93  5:07 PM
 
 
 
 
CARGEN(ATN,ALL) 
 N %C,%R,PK,X,Y,GLO,I,STO,VAL,VALDEF,STOCK,SOR,REP
 S REP=$$REPRESO^%QMEXUTI
 D CLEPAG^%VVIDEO
 S STO="STOCK",VAL="VALDEF"
 S GLO=$$TEMP^%SGUTIL
 D INIT
 
 F I=1:1:15 S VALDEF(I)=""
 S VALDEF(1)=ATN
 F I=3:1:5 S VALDEF(I)=$$^%QSCALIN(REP,ATN,"COMMENTAIRE",I-2)
 S VALDEF(7)=$$^%QSCALIN(REP,ATN,"NOEUD.INITIAL",1)
 S VALDEF(9)=$$^%QSCALIN(REP,ATN,"CONTEXTE.D.ACTIVATION","LARGEUR.VISU")
 S VALDEF(11)=$$^%QSCALIN(REP,ATN,"CONTEXTE.D.ACTIVATION","VISIBLE")
 S VALDEF(11)=$S(VALDEF(11)=0:$$^%QZCHW("NON"),1:$$^%QZCHW("OUI"))
 S VALDEF(12)=$$^%QSCALIN(REP,ATN,"CONTEXTE.D.ACTIVATION","EXPERT")
 S VALDEF(12)=$S(VALDEF(12)=1:$$^%QZCHW("OUI"),1:$$^%QZCHW("NON"))
 S VALDEF(13)=$$^%QSCALIN(REP,ATN,"CONTEXTE.D.ACTIVATION","SUPPRESSION.DE.L.ETUDE")
 S VALDEF(13)=$S(VALDEF(13)=0:$$^%QZCHW("OUI"),1:$$^%QZCHW("NON"))
 S VALDEF(14)=$$^%QSCALIN(REP,ATN,"CONTEXTE.D.ACTIVATION","EXPOSE")
 S VALDEF(14)=$S(VALDEF(14)=1:$$^%QZCHW("OUI"),1:$$^%QZCHW("NON"))
 S VALDEF(15)=$$^%QSCALIN(REP,ATN,"CONTEXTE.D.ACTIVATION","TRAITEMENT.EXPOSE")
 S:VALDEF(15)="" VALDEF(15)="YXP.EXPOSE"
 S VALDEF="STOCK"
DEF 
 D ^%PKSAISI(0,0,1,0,1,GLO,VAL,.ERR)
 
 Q:'($D(STOCK))
 F I=3:1:5 S SOR=$P(STOCK,$C(0),I) D:SOR'="" PA^%QSGESTI(REP,ATN,"COMMENTAIRE",SOR,I-2)
 S SOR=$P(STOCK,$C(0),7) D:SOR'="" PA^%QSGESTI(REP,ATN,"NOEUD.INITIAL",SOR,1)
 S SOR=$P(STOCK,$C(0),9) D:SOR'="" PA^%QSGESTI(REP,ATN,"CONTEXTE.D.ACTIVATION",SOR,"LARGEUR.VISU")
 S SOR=$P(STOCK,$C(0),11) I SOR'="" S SOR=$S(SOR=$$^%QZCHW("NON"):0,1:1) D PA^%QSGESTI(REP,ATN,"CONTEXTE.D.ACTIVATION",SOR,"VISIBLE")
 S SOR=$P(STOCK,$C(0),12) I SOR'="" S SOR=$S(SOR=$$^%QZCHW("OUI"):1,1:0) D PA^%QSGESTI(REP,ATN,"CONTEXTE.D.ACTIVATION",SOR,"EXPERT")
 S SOR=$P(STOCK,$C(0),13) I SOR'="" S SOR=$S(SOR=$$^%QZCHW("OUI"):0,1:1) D PA^%QSGESTI(REP,ATN,"CONTEXTE.D.ACTIVATION",SOR,"SUPPRESSION.DE.L.ETUDE")
 S SOR=$P(STOCK,$C(0),14) I SOR'="" S SOR=$S(SOR=$$^%QZCHW("OUI"):1,1:0) D PA^%QSGESTI(REP,ATN,"CONTEXTE.D.ACTIVATION",SOR,"EXPOSE")
 S SOR=$P(STOCK,$C(0),15) I SOR'="" D PA^%QSGESTI(REP,ATN,"CONTEXTE.D.ACTIVATION",SOR,"TRAITEMENT.EXPOSE")
 K STOCK,@(GLO)
 Q
 
INIT 
 N NBC,I,J,OBLIG,TJSOK,PLL
 
 S NBC=15
 
 
 
 
 
 
 S @GLO@("FL")="LDR"
 
 S @GLO=$$^%QZCHW("caracteristiques generales")
 
 S @GLO@("H")=2,@GLO@("V")=6
 
 S @GLO@("NBC")=NBC
 
 S @GLO@("CHAMPS",1)=$$^%QZCHW("Reseau")
 S @GLO@("CHAMPS",3)=$$^%QZCHW("Commentaire")_"                 - "
 S @GLO@("CHAMPS",4)="                            - "
 S @GLO@("CHAMPS",5)="                            - "
 S @GLO@("CHAMPS",7)=$$^%QZCHW("Noeud initial")
 S @GLO@("CHAMPS",9)=$$^%QZCHW("Largeur d'affichage des noeuds")
 S @GLO@("CHAMPS",11)=$$^%QZCHW("Execution visible (OUI/NON)")
 S @GLO@("CHAMPS",12)=$$^%QZCHW("Mode expert       (OUI/NON)")
 S @GLO@("CHAMPS",13)=$$^%QZCHW("Conserver l'etude (OUI/NON)")
 S @GLO@("CHAMPS",14)=$$^%QZCHW("Mode expose       (OUI/NON)")
 S @GLO@("CHAMPS",15)=$$^%QZCHW("      Traitement d'expose :")
 S (@GLO@("CHAMPS",2),@GLO@("CHAMPS",6),@GLO@("CHAMPS",8),@GLO@("CHAMPS",10))=" "
 
 S PLL=0 F I=1:1:NBC I $L(@GLO@("CHAMPS",I))>PLL S PLL=$L(@GLO@("CHAMPS",I))
 S @GLO@("PLL")=PLL
 
 S @GLO@("L")=40 F I=1:1:NBC S @GLO@("LARG",I)=40
 
 G:'(ALL) FIXED
 S @GLO@("SUIV",3)=4,@GLO@("PREC",3)=15
 S @GLO@("SUIV",4)=5,@GLO@("PREC",4)=3
 S @GLO@("SUIV",5)=7,@GLO@("PREC",5)=4
 S @GLO@("SUIV",7)=9,@GLO@("PREC",7)=5
 S @GLO@("SUIV",9)=11,@GLO@("PREC",9)=7
 S @GLO@("SUIV",11)=12,@GLO@("PREC",11)=9
 S @GLO@("SUIV",12)=13,@GLO@("PREC",12)=11
 S @GLO@("SUIV",13)=14,@GLO@("PREC",13)=12
 S @GLO@("SUIV",14)=15,@GLO@("PREC",14)=13
 S @GLO@("SUIV",15)=3,@GLO@("PREC",15)=14
 G SUITE
FIXED S @GLO@("SUIV",3)=4,@GLO@("PREC",3)=15
 S @GLO@("SUIV",4)=5,@GLO@("PREC",4)=3
 S @GLO@("SUIV",5)=11,@GLO@("PREC",5)=4
 S @GLO@("SUIV",11)=12,@GLO@("PREC",11)=5
 S @GLO@("SUIV",12)=13,@GLO@("PREC",12)=11
 S @GLO@("SUIV",13)=14,@GLO@("PREC",13)=12
 S @GLO@("SUIV",14)=15,@GLO@("PREC",14)=13
 S @GLO@("SUIV",15)=3,@GLO@("PREC",15)=14
SUITE 
 
 S @GLO@("POP1")="",@GLO@("POP2")=""
 
 S @GLO@("AIDE",11)="visualisation du parcours des etats"_$C(0)_"(repondre OUI ou NON)"
 S @GLO@("AIDE",12)="en mode expert les commentaires prologues"_$C(0)_"et epilogue d'un etat ne sont pas"_$C(0)_"affiches"_$C(0)_"(repondre OUI ou NON)"
 S @GLO@("AIDE",13)="conservation des etudes creees lors de"_$C(0)_"l'activation de ce reseau semantique"_$C(0)_"(repondre OUI ou NON)"
 S @GLO@("AIDE",14)="deroulement avec appel des traitements de"_$C(0)_"presentation des etats et affichage de"_$C(0)_"la documentation associee "_$C(0)_"(repondre OUI ou NON)"
 S @GLO@("AIDE",15)="nom du traitement standard d'expose"_$C(0)_"(traitement appele lors du deroulement en mode"_$C(0)_"expose s'il n'existe pas deja un traitement"_$C(0)_"de ce type sur l'etat)"
 
 
 
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
 
VISIBLE(RESEAU) 
 N REPRESO
 S REPRESO=$$REPRESO^%QMEXUTI
 I $$^%QSCALIN(REPRESO,RESEAU,"CONTEXTE.D.ACTIVATION","EXPERT")=1 Q 0
 I $$^%QSCALIN(REPRESO,RESEAU,"CONTEXTE.D.ACTIVATION","VISIBLE")=0 Q 0
 Q 1
 
SUPETU(RESEAU) 
 N REPRESO
 S REPRESO=$$REPRESO^%QMEXUTI
 I $$^%QSCALIN(REPRESO,RESEAU,"CONTEXTE.D.ACTIVATION","SUPPRESSION.DE.L.ETUDE")=0 Q 0
 Q 1
 ;

