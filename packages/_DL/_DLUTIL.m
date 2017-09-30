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

;%DLUTIL^INT^1^59547,73868^0
DLUTIL ;
 
 
 
 
 
 
 
 
 
 
 
MESERR(NOER) 
 Q:NOER=0 ""
 Q:NOER=100 ""
 Q:(NOER<1)!(NOER>43) $$^%QZCHW("Erreur")
 G:NOER>21 MOITER
 Q:NOER=1 $$^%QZCHW("Composant indefini")
 Q:NOER=2 $$AG^%DLCON2_" "_$$^%QZCHW("indefini")
 Q:NOER=3 $$^%QZCHW("Attribut")_" "_$$MACHINE^%DLCON2_" "_$$^%QZCHW("indefini")
 Q:NOER=4 $$^%QZCHW("Attribut")_" "_$$DUFAB^%DLCON2_" "_$$^%QZCHW("indefini")
 Q:NOER=5 $$^%QZCHW("Impossible de placer")_" "_$$ROP^%DLCON2
 Q:NOER=6 $$^%QZCHW("Regime calendaire indefini -> STANDARD utilise")
 Q:NOER=7 $$^%QZCHW("Regime calendaire incomplet")
 Q:NOER=8 $$^%QZCHW("Date limite depassee")
 Q:NOER=9 $$^%QZCHW("Attribut")_" "_$$CAPACITE^%DLCON2_" "_$$^%QZCHW("indefini")
 Q:NOER=10 $$^%QZCHW("Impossible de retrouver les individus de la liste")
 Q:NOER=11 $$CAPACITE^%DLCON2_" "_$$^%QZCHW("depassee")
 Q:NOER=12 $$RART^%DLCON2_" "_$$^%QZCHW("indefini")
 Q:NOER=13 $$DELAI^%DLCON2_" "_$$^%QZCHW("indefini")
 Q:NOER=14 $$RLAN^%DLCON2_": "_$$^%QZCHW("impossible de trouver")_" "_$$ROP^%DLCON2_" "_$$^%QZCHW("correspondant")
 Q:NOER=15 $$RLAN^%DLCON2_": "_$$^%QZCHW("impossible de trouver")_" "_$$DATEJAL^%DLCON2_" "_$$^%QZCHW("correspondant")
 Q:NOER=16 $$^%QZCHW("Attribut")_" QUANTITE "_$$^%QZCHW("indefini")
 Q:NOER=17 $$MACHINE^%DLCON2_" "_$$^%QZCHW("indefini sur")_" "_$$RLAN^%DLCON2
 Q:NOER=18 $$CHARGE^%DLCON2_" "_$$^%QZCHW("indefini sur")_" "_$$RLAN^%DLCON2
 Q:NOER=19 $$GO^%DLCON2_" "_$$^%QZCHW("indefini sur")_" "_$$RGAM^%DLCON2
 Q:NOER=20 $$^%QZCHW("Attribut")_" GAMME "_$$^%QZCHW("indefini sur")_" "_$$RLAN^%DLCON2
 Q:NOER=21 $$^%QZCHW("Individu lien inconnu")
MOITER Q:NOER=22 $$^%QZCHW("Individu lien inverse inconnu")
 Q:NOER=23 $$^%QZCHW("Attribut de duree de fabrication inconnu")
 Q:NOER=24 $$^%QZCHW("Attribut lien inverse de")_" "_$$LINV^%DLCON2_" "_$$^%QZCHW("inconnu")
 Q:NOER=25 $$^%QZCHW("Attribut")_" NUMERO.OPERATION "_$$^%QZCHW("indefini")
 Q:NOER=26 $$AG^%DLCON2_" "_$$^%QZCHW("et")_" "_$$DELFAB^%DLCON2_" "_$$^%QZCHW("indefinis")
 Q:NOER=27 $$^%QZCHW("Aucune etape a rejalonner")
 Q:NOER=28 $$^%QZCHW("Date du jour depassee")
 Q:NOER=29 $$^%QZCHW("Date limite depassee")
 Q:NOER=30 $$CAPACITE^%DLCON2_" "_$$^%QZCHW("indefini")
 Q:NOER=31 $$CAPACITE^%DLCON2_" "_$$^%QZCHW("nulle")
 Q:NOER=32 $$^%QZCHW("Date demandee inferieure a la date limite de debut")
 Q:NOER=33 $$^%QZCHW("Circuit dans le graphe de dependance des operations")
 Q:NOER=34 $$^%QZCHW("Abandon demande par l'utilisateur")
 Q:NOER=35 $$^%QZCHW("Graphe des operations non defini")
 Q:NOER=36 $$^%QZCHW("Circuit dans le graphe des operations")
 Q:NOER=37 $$^%QZCHW("Regime calendaire non defini")
 Q:NOER=38 $$^%QZCHW("Regime calendaire incomplet")
 Q:NOER=39 $$^%QZCHW("Delai maximum de contraction depasse")
 Q:NOER=40 $$^%QZCHW("Nombre de jours de rallonge depasse")
 Q:NOER=41 $$^%QZCHW("Date limite operation(s) precedente(s) depassee")
 Q:NOER=42 $$^%QZCHW("Date limite operation(s) suivante(s) depassee")
 Q:NOER=43 $$^%QZCHW("Impossible de placer l'operation a la date fixee")
 
 
 
 
 
 
 
 
 
 
 
INSERR(REPO,OBJ,NOER,LISRES) 
 Q:NOER=100
 Q:LISRES=""
 N M,I
 S I=$S($D(@LISRES):@LISRES+1,1:1)
 S M="   "_$$MESERR(NOER)
 S @LISRES@(I)=" "
 S @LISRES@(I+1)=$TR($J("",76)," ","*")
 S @LISRES@(I+2)=" "_REPO_" "_OBJ
 S @LISRES@(I+3)=" "
 S @LISRES@(I+4)=M
 S @LISRES@(I+5)=$TR($J("",76)," ","*")
 S @LISRES=I+5
 Q
 
 
 
 
 
 
 
 
 
 
INSERR2(INFO,NOER,LISRES) 
 Q:LISRES=""
 N M,I
 S I=$S($D(@LISRES):@LISRES+1,1:1)
 S M="   "_$$MESERR(NOER)
 S @LISRES@(I)=" "
 S @LISRES@(I+1)=$TR($J("",76)," ","*")
 S @LISRES@(I+2)=" "
 S @LISRES@(I+3)=INFO
 S @LISRES@(I+4)=M
 S @LISRES@(I+5)=" "
 S @LISRES@(I+6)=$TR($J("",76)," ","*")
 S @LISRES=I+6
 Q

